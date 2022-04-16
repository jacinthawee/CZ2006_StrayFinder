import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ImageMngr {

  static Future<String> saveImg(File img, DocumentReference ref) async {
    String imgURL = await uploadFile(img);
    ref.update({'cat_img': imgURL});
    return imgURL;
  }

  static Future<List<String>> saveImgs(List<File> imgs, DocumentReference ref) async {
    List<String> images = [];
    for (var img in imgs) {
      String imgURL = await uploadFile(img);
      ref.update({'cat_img': imgURL});
      images.add(imgURL);
    }
    return images;
  }


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
  
  static Future<void> deleteImg(String imgURL) async{
    await FirebaseStorage.instance
        .refFromURL(imgURL)
        .delete()
        .then((value) => print("Image deleted: $imgURL"))
        .catchError((error) => print("Failed to delete image: $error"));
  }
}