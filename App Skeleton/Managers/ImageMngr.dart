import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

/// Represents the control class that has methods controlling Image
class ImageMngr {

  /// A method to save the image
  static Future<String> saveImg(File img, DocumentReference ref) async {}

  /// A method to save multiple images
  static Future<List<String>> saveImgs(List<File> imgs, DocumentReference ref) async {}

  /// A method to upload image to Firebase Cloud Storage and generate a URL for the image
  static Future<String> uploadFile(File _image) async {}
  
  /// A method to delete image from Firebase Cloud Storage
  static Future<void> deleteImg(String imgURL) async{}
}