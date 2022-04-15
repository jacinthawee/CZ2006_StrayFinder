// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stray_finder/managers/cat_manager.dart';
import 'package:stray_finder/widgets/cat_legend.dart';
import '../ui/cat_map_ui.dart';
import '../ui/vet_ui.dart';
import '../widgets/cat_info.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data' show ByteData, Uint8List;
import 'dart:convert' show utf8;
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
class CatMapScreen extends StatefulWidget {
  const CatMapScreen({ Key? key }) : super(key: key);

  @override
  State<CatMapScreen> createState() => _CatMapScreenState();
}

class _CatMapScreenState extends State<CatMapScreen> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  final CustomInfoWindowController _controller = CustomInfoWindowController();
  // late Future<bool> _hasCatData;
  Set<Marker> _markers = {};
  // late BitmapDescriptor myIcon;
  late Future<List<Uint8List>> _catMarker;

  @override
  void initState() {
    super.initState();
    _catMarker = CatMapUI.getCatMarker();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  // Future<Uint8List> getCatMarker() async {
  //   // cat_marker = await BitmapDescriptor.fromAssetImage(
  //   //   const ImageConfiguration(size: Size(48, 48)), 
  //   //   'assets/images/cat_marker.png');
  //   ByteData data = await rootBundle.load('assets/images/cat_marker.png');
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  //   // var response = await Dio().get<List<int>>(url, options: Options(responseType: ResponseType.bytes));
  //   // ui.Codec codec = await ui.instantiateImageCodec(Uint8List.fromList(response.data!), targetWidth: width);
  // }

  Set<Marker> _createMarkers(List<dynamic> cats, List<Uint8List> catMarker){
    Set<Marker> marker = {};
    marker.addAll(cats.map((cat) {
      LatLng pos = LatLng(cat['lastSeenLoc'].latitude, cat['lastSeenLoc'].longitude);
      return Marker(
        markerId: MarkerId(cat['cat_id'].toString()),
        position: pos,
        icon: cat['is_injured']? BitmapDescriptor.fromBytes(catMarker[1]): BitmapDescriptor.fromBytes(catMarker[0]),
        onTap: (){
          _controller.addInfoWindow!(
            CatInfo(cat, _controller),
            pos,
          );
        }
      );
    }));
    return marker;
  }
  @override
  Widget build(BuildContext context) {
    late List<Uint8List> catMarker;
    late List<Map<String, dynamic>> cats;
    return FutureBuilder(
      future: _catMarker,
      builder: (BuildContext context, AsyncSnapshot<List<Uint8List>> snapshotF){
        if (snapshotF.hasData){
          catMarker = snapshotF.data!;
          return Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('cats').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshotB){
                    if (snapshotB.hasData){
                      var c = snapshotB.data!.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
                      cats = c.map((value) => value.data()).toList();                    
                      return GoogleMap(
                        myLocationButtonEnabled: false,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(1.3521, 103.8198),
                          zoom: 11.5,
                        ),
                        markers: _createMarkers(cats, catMarker),
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
                  }
                ),
                CustomInfoWindow(
                  controller: _controller,
                  height: 170,
                  width: 180,
                  offset: 45,
                ),
                const Align(
                  alignment: Alignment(0.95,-0.97),
                  child: Legend(),
                ),
              ],
            ),
          );
        } else{
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(),)
          );
        }
      }
    );
  }
}