import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../ui/vet_ui.dart';

/// Represents the control class that has methods controlling Vet
class VetMngr {
  /// A set of Google Map Marker representing all vets on Map
  static final Set<Marker> _markers = {};

  /// A list of all Vets across Singapore
  static late final List<dynamic> _vetList;

  /// A method to populate the _vetList by querying Vet information from Gov.data
  /// return a Future<bool> true indicating the query is finished
  static Future<bool> init() async {
    _vetList = await VetUI.queryVets();
    return true;
  }

  /// A method to render all the Markers of Vets
  static Set<Marker> createAllMarkers(BuildContext cxt){
    _markers.addAll(_vetList.map((vet) =>
      Marker(
        markerId: MarkerId(vet['_id'].toString()),
        position: LatLng(vet['lat'], vet['long']),
        onTap: (){
          showModalBottomSheet(
            context: cxt, 
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vet['name']),
                Text("type: " + vet['type']),
                Text("address: " + vet['address']),
                Text("postal: " + vet['postal_code']),
                Text("tel1: " + vet['tel_office_1']),
                Text("tel2: " + vet['tel_office_2']),
                TextButton.icon(
                  onPressed: () => VetUI.openMap(vet['address']), 
                  icon: Icon(Icons.directions_rounded), 
                  label: Text("Open Google Maps"),
                ),
              ],
            ),
          );
        }
      )));
    return _markers;
  }

  /// A method to filter 5 closest Vets and their Markers based on location provided
  static Set<Marker> filterFromLocation(double lat, double long){
    Map<Marker, double> distance = {};
    for (var marker in _markers) {
      LatLng pos = marker.position;
      distance[marker] = Geolocator.distanceBetween(lat, long, pos.latitude, pos.longitude);
    }
    var mapEntries = distance.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    distance
      ..clear()
      ..addEntries(mapEntries.getRange(0, 5));
    return distance.keys.toSet();
  }

}