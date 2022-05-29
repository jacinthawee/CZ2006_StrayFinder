import 'package:geolocator/geolocator.dart';
import '../ui/vet_ui.dart';

/// Represents the control class that has methods controlling Vet
class VetMngr {

  /// A list of all Vets across Singapore
  static late List<dynamic> _vetList;

  /// A method to populate the _vetList by querying Vet information from Gov.data
  /// return true indicating the query is successful and false otherwise
  static Future<bool> init() async {}
  
  /// getter method to get all vets
  static List<dynamic> get vets{}
  
  /// A method to filter 5 closest Vets based on location provided
  static List<dynamic> filterFromLocation(double lat, double long){}

}