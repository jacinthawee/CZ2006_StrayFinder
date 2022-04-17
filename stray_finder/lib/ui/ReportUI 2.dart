import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

class ReportUI {

  static void goUserTabs(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/usertabs',
    );
  }

  static void goDescribeInjury(BuildContext context, int id, String name,
      GeoPoint lastSeen) {
    Navigator.pushNamed(
        context,
        '/describeinjury',
        arguments: {
          'id': id,
          'name': name,
          'lastSeen': lastSeen
          // 'breed': breed,
          // 'injuryStatus': injuryStatus
        }
    );
  }

  static void goThankYouForReporting(BuildContext context) {
    Navigator.pushNamed(
        context,
        '/thankyouforreporting',
        // arguments: {
        //   // 'id': id,
        //   // 'name': name,
        //   // 'breed': breed,
        //   // 'injuryStatus': injuryStatus
        // }
    );
  }

  static void goLeaveContactDetails(BuildContext context, int id,
      String desc, List<String> images, String name, GeoPoint lastSeen) {
      Navigator.pushNamed(
        context,
        '/report', arguments: {
      'id': id,
      'description': desc,
      'images': images,
      'name': name,
      'lastSeen': lastSeen
      // 'breed': breed,
      // 'injuryStatus': injuryStatus
    }
    );
  }

  static void goBringToVet(BuildContext context, int id, String desc, List<String> images, String name,
      GeoPoint lastSeen) {
    Navigator.pushNamed(
        context,
        '/bringtovet',
        arguments: {
          'id': id,
          'description': desc,
          'images': images,
          'name': name,
          'lastSeen': lastSeen
          // 'breed': breed,
          // 'injuryStatus': injuryStatus,


        }
    );
  }

  static void goNameCatFound(BuildContext context, int id, String breed, String imgURL) {
    Navigator.pushNamed(
        context,
        '/namecatfound',
        arguments: {
          'id': id,
          'breed': breed,
          'imgURL': imgURL,
          // 'lastSeenLoc': lastSeen
        }
    );
  }

  static void goAskIfInjured(BuildContext context, int id,
      String name, String breed, String image, bool is_existing) {
    Navigator.pushNamed(
        context,
        '/askifinjured',
        arguments:
        {
          'id': id,
          'name': name,
          'breed': breed,
          'image': image,
          'is_existing': is_existing
        }
    );
  }

  static void goToIsThisTheCatPage(BuildContext context, String image,
      String breed) {
    Navigator.pushNamed(
        context,
        '/isthisthecat',
        arguments: {
          'image': image,
          'breed': breed
        }
    );
  }

  static Future<String> checkCat(File imagePicker) async {
    File image = File(imagePicker.path);
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(image.path)
    });
    var response = await Dio().post(
        'https://catclassifier-aljhyhz73a-as.a.run.app/predict',
        data: formData);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.toString()) as Map<String, dynamic>;
      var result = jsonResponse['result'];
      return result;
    } else {
      throw "Request failed with status: ${response.statusCode}.";
    }
  }

  static Future<String> predictBreed(File imagePicker) async {
    File image = File(imagePicker.path);
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(image.path)
    });
    var response = await Dio().post(
        'https://breedpredictor-qvdglufpcq-as.a.run.app/predict',
        data: formData);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.toString()) as Map<
          String,
          dynamic>;
      var breed = jsonResponse['result'];
      return breed;
    } else {
      throw "Request failed with status: ${response.statusCode}.";
    }
  }

  // static Future<Position?>? getCurrentLocation() async{
  //   var status = await Permission.locationWhenInUse.request();
  //   print(status);
  //   if (status.isGranted) {
  //     var location = await Geolocator.getCurrentPosition();
  //     return location;
  //   } else{
  //     return null;
  //   }
  // }
}
