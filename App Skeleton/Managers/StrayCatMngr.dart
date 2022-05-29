import 'package:cloud_firestore/cloud_firestore.dart';
import './ImageMngr.dart';

/// Represents the control class that has methods controlling StrayCat
class StrayCatMngr {
  
  /// The CollectionReference for cats stored in the Firebase Cloud Firestore
  static CollectionReference cats = FirebaseFirestore.instance.collection('cats');

  /// A method to generate a new ID for a new cat in the database
  static Future<int> setNewID() async {}

  /// A method to add a new stray cat to the Firebase Cloud Firestore consisting of details of the stray cat 
  static Future<void> addCat(int id, String name, String breed, bool statusInjury, GeoPoint lastSeen, String profileImgURL) async {}

  /// A get method to return information about all existing stray cats stored in the Firebase Cloud Firestore
  static Future<List<Map<String, dynamic>>> getAllCatInfo() async {}

  /// A get method to return information about a specific stray cat via its ID
  static Future<Map<String, dynamic>> getCatInfo(int id) async {}

  /// A get method to return all exisitng stray cats stored in the Firebase Cloud Firestore by a specific breed
  static Future<List<Map<String, dynamic>>> getAllCatsByBreed(String breed) async {}

  /// A get method to return information about the injury of a specific stray cat 
  static Future<Map<String, dynamic>> getInjuryInfo(int id) async {}

  /// A get method to return all injured stray cats
  static Future<List<Map<String, dynamic>>> getAllInjuredCats() async {}

  /// A method to update the last seen location of an existing stray cat stored in the Firebase Cloud Firestore
  static Future<void> updateLocation(int id, GeoPoint newLoc) async {}

  /// A method to update the profile photo of an existing stray cat stored in the Firebase Cloud Firestore
  Future<void> updatePhoto(int id, String newURL) async {}

  /// A method to update the injury status of an existing stray cat stored in the Firebase Cloud Firestore
  static Future<void> updateStatus(int id, bool newStatus) async {}

  /// A get method to return the image URL of a stray cat
  static Future<String> getImgURL(int id) async{}

}
