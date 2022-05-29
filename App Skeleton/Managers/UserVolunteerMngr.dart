import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents the control class that has methods controlling UserVolunteer
class UserVolunteerMngr {

  /// A method to add a new user(volunteer) to the Firebase Cloud Firestore
  static Future<void> addUser(String email, String contactNo, String orgName, String address) async{}

  /// A get method to return information about a specific user(volunteer)
  static Future<Map<String, dynamic>> getVolunteerInfo(String email) async {}

  /// A method to check if the organisation name of a volunteer group already exists in the database
  static Future<bool> checkDupName(String name) async{}

  /// A method to edit the profile information of a user(volunteer)
  static Future<void> editProfile(String email, String newName, String newContact, String newAddress) async{}
}