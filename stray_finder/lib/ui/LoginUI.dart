import 'package:flutter/material.dart';

/// Represents the boundary class that handles input related to Login
class LoginUI{

  /// The method to redirect to home page
  static void goHome(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/',
    );
  }

  /// The method to redirect to volunteer tabs 
  static void goVolunteerTabs(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/volunteertabs',
    );
  }

  /// The method to reset the password of the registered account of the user(volunteer)
  static void resetPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgetpassword');
  }

  /// The method to redirect to register page
  static void goRegister(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/register',
    );
  }
}