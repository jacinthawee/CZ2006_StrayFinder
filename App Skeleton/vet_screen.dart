import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../managers/vet_manager.dart';
import '../ui/vet_ui.dart';

/// A class that render VetScreen
class VetScreen extends StatefulWidget {
  const VetScreen({Key? key}) : super(key: key);

  @override
  _VetScreenState createState() => _VetScreenState();
}

class _VetScreenState extends State<VetScreen>{
  final Completer<GoogleMapController> _controller = Completer();
  late Future<bool> _hasVetData;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _hasVetData = VetMngr.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _hasVetData,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
          if (snapshot.hasData){
            if (_markers.isEmpty){
              _markers = VetMngr.createAllMarkers(context);
            }
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(1.3521, 103.8198),
                zoom: 11.5,
              ),
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // handle no access exception
          var _location = await VetUI.getCurrentLocation();
          setState(() => 
            _markers = VetMngr.filterFromLocation(_location.latitude, _location.latitude));
        },
      ),
    );
  }
  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => true;
}