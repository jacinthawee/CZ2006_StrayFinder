import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../ui/cat_map_ui.dart';
import '../widgets/injury_info.dart';

class CatDetailScreen extends StatelessWidget {
  static const routeName = '/cat_detail_screen';
  final CustomInfoWindowController _controller = CustomInfoWindowController();

  Set<Marker> _createMarkers(GeoPoint loc, Map<String, dynamic> cat, Uint8List cat_marker){
    Set<Marker> marker = {};
    LatLng pos = LatLng(loc.latitude, loc.longitude);
    marker.add(
      Marker(
        markerId: MarkerId(cat['cat_id'].toString()),
        position: pos,
        icon: BitmapDescriptor.fromBytes(cat_marker),
        onTap: (){
          _controller.addInfoWindow!(
            InjuryInfo(cat, _controller),
            pos,
          );
        }
      )
    );
    return marker;
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    GeoPoint pos = routeArgs['lastSeen'];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(routeArgs['cat_name']),
      ),
      body: FutureBuilder(
        future: CatMapUI.getCatMarker(),
        builder: (BuildContext context, AsyncSnapshot<List<Uint8List>> snapshot) {
          if (snapshot.hasData){
            return Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(pos.latitude, pos.longitude),
                    zoom: 11.5,
                  ),
                  markers: _createMarkers(pos, routeArgs, snapshot.data![1]),
                  onCameraMove: (position) {
                    _controller.onCameraMove!();
                  },
                  onMapCreated: (GoogleMapController controller) async {
                    _controller.googleMapController = controller;
                  },
                ),
                CustomInfoWindow(
                  controller: _controller,
                  height: 110,
                  width: 180,
                  offset: 45,
                ),
              ],
            );
          } else{
            return const CircularProgressIndicator();
          }
        },
      ),
    );

    // return FutureBuilder(
    //   future: CatMapUI.getCatMarker(),
    //   builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshotF){
    //     if (snapshotF.hasData){
    //       return Scaffold(
    //         appBar: AppBar(
    //           foregroundColor: Theme.of(context).colorScheme.secondary,
    //           backgroundColor: Theme.of(context).primaryColor,
    //           title: Text(routeArgs['cat_name']),
    //         ),
    //         body: Stack(
    //           children: [
    //             GoogleMap(
    //               myLocationButtonEnabled: false,
    //               initialCameraPosition: CameraPosition(
    //                 target: LatLng(pos.latitude, pos.longitude),
    //                 zoom: 11.5,
    //               ),
    //               markers: _createMarkers(pos, routeArgs),
    //               onCameraMove: (position) {
    //                 _controller.onCameraMove!();
    //               },
    //               onMapCreated: (GoogleMapController controller) async {
    //                 _controller.googleMapController = controller;
    //               },
    //             ),
    //             CustomInfoWindow(
    //               controller: _controller,
    //               height: 120,
    //               width: 160,
    //               offset: 45,
    //             ),
    //           ],
    //         ),
    //       );
    //     }else{

    //     }
    //   }
    // );
    // // return Scaffold(
    // //   appBar: AppBar(
    // //     foregroundColor: Theme.of(context).colorScheme.secondary,
    // //     backgroundColor: Theme.of(context).primaryColor,
    // //     title: Text(routeArgs['cat_name']),
    // //   ),
    // //   body: Stack(
    // //     children: [
    // //       GoogleMap(
    // //         myLocationButtonEnabled: false,
    //         initialCameraPosition: CameraPosition(
    //           target: LatLng(pos.latitude, pos.longitude),
    //           zoom: 11.5,
    //         ),
    //         markers: _createMarkers(pos, routeArgs),
    //         onCameraMove: (position) {
    //           _controller.onCameraMove!();
    //         },
    //         onMapCreated: (GoogleMapController controller) async {
    //           _controller.googleMapController = controller;
    //         },
    //       ),
    //       CustomInfoWindow(
    //         controller: _controller,
    //         height: 120,
    //         width: 160,
    //         offset: 45,
    //       ),
    //     ],
    //   ),
    // );
  }
}