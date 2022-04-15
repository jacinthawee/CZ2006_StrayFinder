import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../ui/cat_map_ui.dart';

/// Represents the control class that has methods controlling stray cat
class CatMngr {
  static final CollectionReference colRef = FirebaseFirestore.instance.collection('cats');
  /// A list of cats obtained from querying database
  static late List<Map<String, dynamic>> _catList;

  static Future<bool> init() async {
    _catList = await CatMapUI.queryCats();
    return true;
  }
  static List<Map<String, dynamic>> get cats{
    return _catList;
  }

  /// A method to filter 5 closest cats and their Markers based on location provided
  static List<dynamic> filterFromLocation(double lat, double long, List<Map<String, dynamic>> catList){
    if (catList.length < 5){
      return catList;
    }
    Map<dynamic, double> distance = {};
    for (var cat in catList) {
      GeoPoint loc = cat['lastSeenLoc'];
      distance[cat] = Geolocator.distanceBetween(lat, long, loc.latitude, loc.longitude);
    }
    var mapEntries = distance.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    distance
      ..clear()
      ..addEntries(mapEntries.getRange(0, 5));
    return distance.keys.toList();
  }

  
}