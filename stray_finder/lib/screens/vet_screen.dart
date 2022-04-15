import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:stray_finder/widgets/vet_info.dart';
import '../managers/vet_manager.dart';
import '../ui/map_ui.dart';

/// A class that render VetScreen
class VetScreen extends StatefulWidget {
  const VetScreen({Key? key}) : super(key: key);

  @override
  _VetScreenState createState() => _VetScreenState();
}

class _VetScreenState extends State<VetScreen> {
  ValueNotifier<bool> _isDialOpen = ValueNotifier(false);
  final CustomInfoWindowController _controller = CustomInfoWindowController();
  late Future<bool> _hasVetData;
  late Future<Uint8List> _vetMarker;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _hasVetData = VetMngr.init();
    _vetMarker = MapUI.getMarkerFromAsset('assets/images/vet.png');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Set<Marker> _createMarkers(List<dynamic> vets, Uint8List vetMarker) {
    // Set<Marker> _createMarkers(){
    // List<Map<String, dynamic>> vets = [{'_id':1, 'lat':1.3521, 'long':103.8198, 'address':'1 Turf Club Avenue Singapore Racecourse',
    // 'name':'Singapore Turf Club Equine Hospital',
    // 'postal_code': '637659',
    // 'tel_office_1':'68791000', 'tel_office_2': 'na', 'type': 'Clinic', },
    // {'_id':2, 'lat':1.3515, 'long':103.6805, 'address':'1 Turf Club Avenue Singapore Racecourse',
    // 'name':'Singapore Turf Club Equine Hospital',
    // 'postal_code': '637659',
    // 'tel_office_1':'68791000', 'tel_office_2': 'na', 'type': 'Clinic', }];
    Set<Marker> marker = {};
    marker.addAll(vets.map((vet) {
      LatLng pos = LatLng(vet['lat'], vet['long']);
      return Marker(
          markerId: MarkerId(vet['_id'].toString()),
          position: pos,
          icon: BitmapDescriptor.fromBytes(vetMarker),
          onTap: () {
            _controller.addInfoWindow!(
              VetInfo(vet, _controller),
              pos,
            );
          });
    }));
    return marker;
  }

  @override
  Widget build(BuildContext context) {
    late Uint8List vetMarker;
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: Future.wait([_hasVetData, _vetMarker]),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.hasData) {
                  vetMarker = snapshot.data![1];
                  if (_markers.isEmpty) {
                    if (snapshot.data![0] == true){
                      _markers = _createMarkers(VetMngr.vets, vetMarker);
                    } else {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text(
                                "Could not fetch vets data. Please make sure device is connected to Internet and refresh."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: Text("OK",
                                    style: TextStyle(color: Color(0xff754E46))),
                              )
                            ],
                          );
                        },
                      );
                    }
                  }
                  return GoogleMap(
                    myLocationButtonEnabled: false,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(1.3521, 103.8198),
                      zoom: 11.5,
                    ),
                    markers: _markers,
                    onCameraMove: (position) {
                      _controller.onCameraMove!();
                    },
                    onMapCreated: (GoogleMapController controller) async {
                      _controller.googleMapController = controller;
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          CustomInfoWindow(
            controller: _controller,
            height: 170,
            width: 210,
            offset: 45,
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          openCloseDial: _isDialOpen,
          overlayOpacity: 0.5,
          spacing: 15,
          spaceBetweenChildren: 15,
          closeManually: true,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.location_pin),
                label: "Filter nearest 5 vets",
                onTap: () async {
                  _isDialOpen.value = false;
                  try {
                    var _location = await MapUI.getCurrentLocation();
                    setState(() {
                      List<dynamic> vets = VetMngr.filterFromLocation(
                          _location.latitude, _location.longitude);
                      _markers = _createMarkers(vets, vetMarker);
                    });
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Please grant location access in settings to show nearest 5 vets!"),
                          actions: [
                            TextButton(
                              onPressed: ()=>Navigator.pop(ctx),
                              child: Text("OK",
                                style: TextStyle(color: Color(0xff754E46))),
                            )
                          ],
                        );
                      },
                    );
                  }
                }),
            SpeedDialChild(
                child: const Icon(Icons.local_hospital),
                label: "Show all vets",
                onTap: () {
                  _isDialOpen.value = false;
                  setState(() {
                    List<dynamic> vets = VetMngr.vets;
                    _markers = _createMarkers(vets, vetMarker);
                  });
                }),
            SpeedDialChild(
                child: const Icon(Icons.refresh),
                label: "Refresh",
                onTap: () {
                  _isDialOpen.value = false;
                  setState(() {
                    _hasVetData = VetMngr.init();
                  });
                }),
          ]),

    );
  }
}
