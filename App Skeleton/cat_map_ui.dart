import 'package:geocoder2/geocoder2.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';

/// Represents the boundary class that has user interface methods relating to stray cat
class CatMapUI{

  /// A method to launch Google Map to navigate to corresponding destination
  static Future<void> openMap(String dest) async {
    dest = dest.replaceAll(" ", "+");
    String googleMapUrl = "https://www.google.com/maps/dir/?api=1&destination=$dest";
    if (!await launch(googleMapUrl, forceSafariVC: false)){
      throw 'Could not open Google Maps';
    }
  }

  /// A method to query all cats information from database
  static Future<List<dynamic>> queryCats() async {
    return [];
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
}