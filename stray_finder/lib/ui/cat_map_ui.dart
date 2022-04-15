import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stray_finder/classes/stray_cat.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';

/// Represents the boundary class that has user interface methods relating to stray cat
class CatMapUI{
  static final CollectionReference cats = FirebaseFirestore.instance.collection('cats');

  static Future<void> addCat(StrayCat cat) {
    return cats
        .doc(cat.id.toString())
        .set({
          'cat_name': cat.name, // Benson
          'cat_breed': cat.breed, // Persian
          'cat_id': cat.id, // 42
          'is_injured': cat.isInjured,
          'last_seen': cat.lastSeen,
          'cat_img': cat.profileImgURL,
        })
        .then((value) => print("Cat Added"))
        .catchError((error) => print("Failed to add cat: $error"));
  }

  /// A method to query all cats information from database
  static Future<List<Map<String, dynamic>>> queryCats() async{
    List<Map<String, dynamic>> allCats = [];
    await FirebaseFirestore.instance
        .collection('cats')
        .get()
        .then((value){
          for (var cat in value.docs){
            allCats.add(cat.data());
          }
        });
    // print(allCats.toString());
    return allCats;
  }

  /// A method to launch Google Map to navigate to corresponding destination
  static Future<void> openMap(String dest) async {
    dest = dest.replaceAll(" ", "+");
    String googleMapUrl = "https://www.google.com/maps/dir/?api=1&destination=$dest";
    if (!await launch(googleMapUrl, forceSafariVC: false)){
      throw 'Could not open Google Maps';
    }
  }
  
  /// A method to get user's current location
  static Future<Position> getCurrentLocation() async{
    var status = await Permission.location.request();
    if (status.isGranted) {
      var location = await Geolocator.getCurrentPosition();
      return location;
    } else{
      throw "Access Denied";
    }
  }
  static Future<List<Uint8List>> getCatMarker() async {

    List<Uint8List> markers = [];
    ByteData data;
    ui.Codec codec;
    ui.FrameInfo fi;
    data = await rootBundle.load('assets/images/cat_marker0.png');
    codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
    fi = await codec.getNextFrame();
    markers.add((await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List());

    data = await rootBundle.load('assets/images/cat_marker1.png');
    codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
    fi = await codec.getNextFrame();
    markers.add((await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List());
    // var response = await Dio().get<List<int>>(url, options: Options(responseType: ResponseType.bytes));
    // ui.Codec codec = await ui.instantiateImageCodec(Uint8List.fromList(response.data!), targetWidth: width);
    return markers;
  }
}