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
  static Future<void> openMap(String dest) async {
    dest = dest.replaceAll(" ", "+");
    String googleMapUrl = "https://www.google.com/maps/dir/?api=1&destination=$dest";
    if (!await launch(googleMapUrl, forceSafariVC: false)){
      throw 'Could not open Google Maps';
    }
  }

  /// A method to get user's current location
  static Future<Position> getCurrentLocation() async{
    var status = await Permission.location.request();
    if (status.isGranted) {
      var location = await Geolocator.getCurrentPosition();
      return location;
    } else{
      throw "Access Denied";
    }
  }

  /// A method to turn input postal code to latitude and longitudes
  static Future<GeoPoint> geoCode(String postal) async{
    GeoData data = await Geocoder2.getDataFromAddress(
      address: "Singapore+$postal",
      googleMapApiKey: "AIzaSyDEgZFylVwu14etIAO19y2XDVMoIVvQTkw");
    return GeoPoint(data.latitude, data.longitude);
  }

  /// A method to render customized google maps marker from asset images
  static Future<Uint8List> getMarkerFromAsset(String path) async {
    ByteData data;
    ui.Codec codec;
    ui.FrameInfo fi;
    data = await rootBundle.load(path);
    codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
    fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}