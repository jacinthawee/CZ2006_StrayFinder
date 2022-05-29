import 'package:cloud_firestore/cloud_firestore.dart';
import './StrayCatMngr.dart';
import './ImageMngr.dart';

/// Represents the control class that has methods controlling Injury
class InjuryMngr {

  /// The CollectionReference for injuries stored in Firebase Cloud Firestore
  static CollectionReference injuries = FirebaseFirestore.instance.collection('injuries');

  /// A method to add an injury containing all details of the injury of the reported stray cat to Firebase Cloud Firestore
  static Future<void> addInjury(int catid, String description, List<String> photos, String passerbyContact, String passerbyName, String catName, GeoPoint lastSeen){}

  /// A method to delete an injury and its associated images from Firebase Cloud Firestore while updating the injury status of the stray cat involved
  static Future<void> deleteInjury(int catid) async{}

  /// A get method to return the contact number of the user(passerby) bringing the injured cat to the vet
  static Future<String> getContact(int catid) async{}

  /// A method to check if the stray cat is injured or not
  static Future<bool> checkInjury(int catid) async{}

}