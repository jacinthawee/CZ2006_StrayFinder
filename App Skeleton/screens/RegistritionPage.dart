import 'package:flutter/material.dart';
import '../managers/RegisterMngr.dart';
import '../ui/RegisterUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../managers/UserVolunteerMngr.dart';

/// Registrition page
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

/// state of the page
class _RegistrationPageState extends State<RegistrationPage> {
  /// FirebaseAuth instance to help register a user
  final _auth = FirebaseAuth.instance;
  /// user's input email
  late String email;
  /// user's input password
  late String password;
  /// user's input contact number
  late String contactno;
  /// user's input organization name
  late String orgname;
  /// user's input address
  late String address;
  /// whether to show spinner when the registrition is loading
  bool showSpinner = false;
  /// to show/hide the input password
  bool _isHiddenPassword = true;
  /// controller for email text field
  final myController = TextEditingController();
  /// controller for password text field
  final myController1 = TextEditingController();
  /// controller for contact number text field
  final myController2 = TextEditingController();
  /// controller for orgnization name text field
  final myController3 = TextEditingController();
  /// controller for address text field
  final myController4 = TextEditingController();
  /// whether the user click register button
  bool submit = false;

  /// a method to control the show/hide password
  void _togglePassword() {
  }

  /// build the page
  @override
  Widget build(BuildContext context) {
    
  }
}
/// show dialog box for error message
showAlertDialog(BuildContext context, String e, String a) {
}
