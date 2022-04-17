import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents the control class that has methods controlling UserVolunteer
class UserVolunteerMngr {

  /// A method to add a new user(volunteer) to the Firebase Cloud Firestore
  static Future<void> addUser(String email, String contactNo, String orgName, String address) async{
    await FirebaseFirestore.instance.collection('users')
        .doc(email)
        .set({
      'user_email': email,
      'user_contact': contactNo,
      'org_name': orgName,
      'org_address': address,
    })
        .then((value) => print("Volunteer Added"))
        .catchError((error) => print("Failed to add volunteer: $error"));
  }

  /// A get method to return information about a specific user(volunteer)
  static Future<Map<String, dynamic>> getVolunteerInfo(String email) async {
    Map<String, dynamic> user = {};
    await FirebaseFirestore.instance
        .collection('users')
        .where('user_email', isEqualTo: email)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        user['user_email'] = email;
        user['user_contact'] = result.data()['user_contact'];
        user['org_name'] = result.data()['org_name'];
        user['org_address'] = result.data()['org_address'];
      });
    });
    return user;
  }

  /// A method to check if the organisation name of a volunteer group already exists in the database
  static Future<bool> checkDupName(String name) async{
    var result = await FirebaseFirestore.instance
        .collection('users')
        .where('org_name', isEqualTo: name)
        .get();
    if (result.docs.isEmpty) {
      return false;
    }
    else {
      return true;
    }
  }

  /// A method to edit the profile information of a user(volunteer)
  static Future<void> editProfile(String email, String newName, String newContact, String newAddress) async{
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .update({'org_name': newName, 'user_contact': newContact, 'org_address': newAddress})
        .then((value) => print("Profile updated"))
        .catchError((error) => print("Failed to update profile: $error"));
  }
}