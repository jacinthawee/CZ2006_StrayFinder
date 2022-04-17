import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

/// Represents the control class that has methods controlling Image
class ImageMngr {

  /// A method to save the image
  static Future<String> saveImg(File img, DocumentReference ref) async {
    String imgURL = await uploadFile(img);
    ref.update({'cat_img': imgURL});
    return imgURL;
  }

  /// A method to save multiple images
  static Future<List<String>> saveImgs(List<File> imgs, DocumentReference ref) async {
    List<String> images = [];
    for (var img in imgs) {
      String imgURL = await uploadFile(img);
      ref.update({'cat_img': imgURL});
      images.add(imgURL);
    }
    return images;
  }

  /// A method to upload image to Firebase Cloud Storage and generate a URL for the image
  static Future<String> uploadFile(File _image) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child(
        'images/${path.basename(_image.path)}');
    await imagesRef.putFile(_image);
    String returnURL = await imagesRef.getDownloadURL();
    print('done with image upload!');
    print(returnURL);
    return returnURL;
  }
  
  /// A method to delete image from Firebase Cloud Storage
  static Future<void> deleteImg(String imgURL) async{
    await FirebaseStorage.instance
        .refFromURL(imgURL)
        .delete()
        .then((value) => print("Image deleted: $imgURL"))
        .catchError((error) => print("Failed to delete image: $error"));
  }
}