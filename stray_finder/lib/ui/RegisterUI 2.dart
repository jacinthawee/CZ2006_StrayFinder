import 'package:flutter/material.dart';


class RegisterUI{

  static void goLogin(BuildContext context) {

    Navigator.pushNamed(
      context,
      '/login',
    );
  }

  // static Null registerUserToDatabase() {
  //   async {
  //     if (_formKey.currentState.validate()) {
  //       _register();
  //     }
  //   }
  // };
}