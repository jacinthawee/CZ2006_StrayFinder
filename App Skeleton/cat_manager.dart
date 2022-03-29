import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../ui/cat_map_ui.dart';

/// Represents the control class that has methods controlling stray cat
class CatMngr {
  /// A set of Google Map Marker representing all cats on Map
  static final Set<Marker> _markers = {};

  /// A list of cats obtained from querying database
  static late final List<dynamic> _catList;

  /// A method to render all the Markers of cats
  static Set<Marker> createAllMarkers(BuildContext cxt){
    return {};
  }

  /// A method to filter 5 closest cats and their Markers based on location provided
  static Set<Marker> filterFromLocation(double lat, double long){
    return {};
  }

  
}