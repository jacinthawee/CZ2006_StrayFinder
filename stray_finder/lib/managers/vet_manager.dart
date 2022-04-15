import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../ui/vet_ui.dart';
import 'dart:ui' as ui;
/// Represents the control class that has methods controlling Vet
class VetMngr {

  /// A list of all Vets across Singapore
  static late List<dynamic> _vetList;

  /// A method to populate the _vetList by querying Vet information from Gov.data
  /// return a Future<bool> true indicating the query is finished
  static Future<bool> init() async {
    _vetList = await VetUI.queryVets();
    return true;
  }
  static Future<Uint8List> getVetMarker() async {
    // cat_marker = await BitmapDescriptor.fromAssetImage(
    //   const ImageConfiguration(size: Size(48, 48)), 
    //   'assets/images/cat_marker.png');
    ByteData data = await rootBundle.load('assets/images/vet.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
    // var response = await Dio().get<List<int>>(url, options: Options(responseType: ResponseType.bytes));
    // ui.Codec codec = await ui.instantiateImageCodec(Uint8List.fromList(response.data!), targetWidth: width);
  }
  
  static List<dynamic> get vets{
    return _vetList;
  }
  /// A method to filter 5 closest Vets and their Markers based on location provided
  static List<dynamic> filterFromLocation(double lat, double long){
    // Map<Marker, double> distance = {};
    Map<dynamic, double> distance = {};
    for (var vet in _vetList) {
      // LatLng pos = marker.position;
      distance[vet] = Geolocator.distanceBetween(lat, long, vet['lat'], vet['long']);
    }
    var mapEntries = distance.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    distance
      ..clear()
      ..addEntries(mapEntries.getRange(0, 5));
    return distance.keys.toList();
  }

}