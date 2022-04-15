import 'package:geolocator/geolocator.dart';
import '../ui/vet_ui.dart';

/// Represents the control class that has methods controlling Vet
class VetMngr {

  /// A list of all Vets across Singapore
  static late List<dynamic> _vetList;

  /// A method to populate the _vetList by querying Vet information from Gov.data
  /// return true indicating the query is successful and false otherwise
  static Future<bool> init() async {
    _vetList = await VetUI.queryVets();
    return _vetList.isEmpty? false : true;
  }
  
  /// getter method to get all vets
  static List<dynamic> get vets{
    return _vetList;
  }
  /// A method to filter 5 closest Vets based on location provided
  static List<dynamic> filterFromLocation(double lat, double long){
    Map<dynamic, double> distance = {};
    for (var vet in _vetList) {
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