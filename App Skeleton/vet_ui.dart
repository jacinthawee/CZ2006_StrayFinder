import 'package:geocoder2/geocoder2.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';

/// Represents the boundary class that has user interface methods relating to Vet
class VetUI{

  /// A method to launch Google Map to navigate to corresponding destination
  static Future<void> openMap(String dest) async {
    dest = dest.replaceAll(" ", "+");
    String googleMapUrl = "https://www.google.com/maps/dir/?api=1&destination=$dest";
    if (!await launch(googleMapUrl, forceSafariVC: false)){
      throw 'Could not open Google Maps';
    }
  }

  /// A method to query all vets information from Gov.data
  static Future<List<dynamic>> queryVets() async {
    var url = Uri.https('data.gov.sg', '/api/action/datastore_search', {'resource_id': 'b2871270-4eef-44a3-be98-908e2a73b19f'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> vetList = jsonResponse['result']['records'];
      for (var vet in vetList){
        var addr = "Singapore " + vet['postal_code'];
        GeoData data = await Geocoder2.getDataFromAddress(
          address: addr,
          googleMapApiKey: "API key");
        vet['lat'] = data.latitude;
        vet['long'] = data.longitude;
      }
      return vetList; // a list of Map
    } else {
      throw "Request failed with status: ${response.statusCode}.";
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
}