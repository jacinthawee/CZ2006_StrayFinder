import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

/// Represent the boundary class that has user interface methods relating to Google Maps
class MapUI {
  
  /// A method to launch Google Map to navigate to corresponding destination
  static Future<void> openMap(String dest) async {}

  /// A method to get user's current location
  static Future<Position> getCurrentLocation() async{}

  /// A method to turn input postal code to latitude and longitudes
  static Future<GeoPoint> geoCode(String postal) async{}

  /// A method to render customized google maps marker from asset images
  static Future<Uint8List> getMarkerFromAsset(String path) async {}
}