import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

/// Represents the boundary class which handles input related to the Report function
class ReportUI {

  /// The method to reedirect to the user tabs
  static void goUserTabs(BuildContext context) {}

  /// The method to redirect to the describe injury page
  static void goDescribeInjury(BuildContext context, int id, String name, GeoPoint lastSeen) {}

  /// The method to redirect to the thank you for reporting page
  static void goThankYouForReporting(BuildContext context) {}

  /// The method to redirect to the leave contact details page
  static void goLeaveContactDetails(BuildContext context, int id, String desc, List<String> images, String name, GeoPoint lastSeen) {}

  /// The method to redirect to the bring to vet page
  static void goBringToVet(BuildContext context, int id, String desc, List<String> images, String name, GeoPoint lastSeen) {}

  /// The method to redirect to the name cat found page
  static void goNameCatFound(BuildContext context, int id, String breed, String imgURL) {}

  /// The method to redirect to the ask if injured page
  static void goAskIfInjured(BuildContext context, int id, String name, String breed, String image, bool is_existing) {}

  /// The method to redirect to the is this the cat page
  static void goToIsThisTheCatPage(BuildContext context, String image, String breed) {}

  /// The method to check if the image uploaded is that of a cat
  static Future<String> checkCat(File imagePicker) async {}

  /// The method to predict the breed of the reported stray cat
  static Future<String> predictBreed(File imagePicker) async {}
}
