import 'package:cloud_firestore/cloud_firestore.dart';

class UserVolunteer {

  Future<void> addUser(String email, String contactNo, String orgName, String address) async{
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

  Future<Map<String, dynamic>> getVolunteerInfo(String email) async {
    Map<String, dynamic> user = {};
    await FirebaseFirestore.instance
        .collection('users')
        .where('user_email', isEqualTo: email)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        // user.update('user_email', (value) => result.data()['user_email']);
        // user.update('user_contact', (value) => result.data()['user_contact']);
        // user.update('org_name', (value) => result.data()['org_name']);
        // user.update('org_address', (value) => result.data()['org_address']);
        user['user_email'] = email;
        user['user_contact'] = result.data()['user_contact'];
        user['org_name'] = result.data()['org_name'];
        user['org_address'] = result.data()['org_address'];
      });
    });
    return user;
  }
  Future<bool> checkDupName(String name) async{
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
  Future<void> editProfile(String email, String newName, String newContact, String newAddress) async{
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .update({'org_name': newName, 'user_contact': newContact, 'org_address': newAddress})
        .then((value) => print("Profile updated"))
        .catchError((error) => print("Failed to update profile: $error"));
  }

  // Future<void> editOrgName(String email, String newName) async{
  //   return await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(email)
  //       .update({'org_name': newName})
  //       .then((value) => print("Organisation name updated"))
  //       .catchError((error) => print("Failed to update organisation name: $error"));
  // }
  //
  // Future<void> editContactNo(String email, String newContact) async{
  //   return await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(email)
  //       .update({'user_contact': newContact})
  //       .then((value) => print("Volunteer contact no updated"))
  //       .catchError((error) => print("Failed to update volunteer contact no: $error"));
  // }
  //
  // Future<void> editAddress(String email, String newAddress) async{
  //   return await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(email)
  //       .update({'org_address': newAddress})
  //       .then((value) => print("Volunteer address updated"))
  //       .catchError((error) => print("Failed to update volunteer address: $error"));
  // }
}