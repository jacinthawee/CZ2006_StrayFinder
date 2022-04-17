import 'package:geocoder2/geocoder2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/// Represents the boundary class that has user interface methods relating to Vet
class VetUI{
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
          googleMapApiKey: "AIzaSyDEgZFylVwu14etIAO19y2XDVMoIVvQTkw");
        vet['lat'] = data.latitude;
        vet['long'] = data.longitude;
      }
      return vetList; // a list of Map
    } else {
      return [];
    }
  }

}