import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import '../ui/ReportUI.dart';
import '../managers/ImageMngr.dart';

/// A page where the user will take picture or upload picture of the cat they want to report
class UploadPicturePage extends StatefulWidget {
  @override
  _UploadPicturePageState createState() => _UploadPicturePageState();
}

/// state of the page
class _UploadPicturePageState extends State<UploadPicturePage> {
  /// show spinner when the page is loading
  bool showSpinner = false;
  /// A `File` that represent the photo taken from camera when user click 'take photo'
  var _image;
  /// A `File` that represent the uploaded image when user select from their gallery
  var _image2;
  /// allow users to select picture to upload from gallery
  final picker = ImagePicker();

  /// A method to generate `File` from the photo taken by user
  Future<void> chooseImage() async {
  }
  /// A method to generate `File` from the photo selected from gallery by user
  Future<void> chooseImageGallery() async {
  }
  /// build the page
  @override
  Widget build(BuildContext context) {
  }
}

/// show dialog box for error message
showAlertDialog(BuildContext context) {
  
}

