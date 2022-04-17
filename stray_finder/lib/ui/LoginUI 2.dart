import 'package:flutter/material.dart';

class LoginUI{

  static void goHome(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/',
    );
  }

  static void goVolunteerTabs(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/volunteertabs',
    );
  }

  static void resetPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgetpassword');
  }

  static void goRegister(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/register',
    );
  }
}