import 'package:cloud_firestore/cloud_firestore.dart';
import './ImageMngr.dart';

/// Represents the control class that has methods controlling StrayCat
class StrayCatMngr {
  
  /// The CollectionReference for cats stored in the Firebase Cloud Firestore
  static CollectionReference cats = FirebaseFirestore.instance.collection('cats');

  /// A method to generate a new ID for a new cat in the database
  static Future<int> setNewID() async {
  int id = 0;
  await FirebaseFirestore.instance
        .collection('cats')
        .orderBy('cat_id', descending: true)
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        id = 1;
      } else {
        value.docs.forEach((result) {id = result.data()['cat_id'] + 1;
        });
      }
    });
    return id;
  }

  /// A method to add a new stray cat to the Firebase Cloud Firestore consisting of details of the stray cat 
  static Future<void> addCat(int id, String name, String breed, bool statusInjury,
      GeoPoint lastSeen, String profileImgURL) async {
    return await cats
        .doc(id.toString())
        .set({
          'cat_id': id,
          'cat_name': name,
          'cat_breed': breed,
          'is_injured': statusInjury,
          'lastSeenLoc': lastSeen,
          'img_URL': profileImgURL,
        })
        .then((value) => print("Cat Added"))
        .catchError((error) => print("Failed to add cat: $error"));
  }

  /// A get method to return information about all existing stray cats stored in the Firebase Cloud Firestore
  static Future<List<Map<String, dynamic>>> getAllCatInfo() async {
    List<Map<String, dynamic>> items = [];
    await FirebaseFirestore.instance.collection('cats').get().then((value) {
      value.docs.forEach((result) {
        items.add(result.data());
      });
    });
    return items;
  }

  /// A get method to return information about a specific stray cat via its ID
  static Future<Map<String, dynamic>> getCatInfo(int id) async {
    Map<String, dynamic> cat = {};
    await FirebaseFirestore.instance
        .collection('cats')
        .where('cat_id', isEqualTo: id)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        cat.update('cat_id', (value) => result.data()['cat_id']);
        cat.update('cat_name', (value) => result.data()['cat_name']);
        cat.update('cat_breed', (value) => result.data()['cat_breed']);
        cat.update('is_injured', (value) => result.data()['is_injured']);
        cat.update('lastSeenLoc', (value) => result.data()['lastSeenLoc']);
        cat.update('img_URL', (value) => result.data()['img_URL']);
      });
    });
    return cat;
  }

  /// A get method to return all exisitng stray cats stored in the Firebase Cloud Firestore by a specific breed
  static Future<List<Map<String, dynamic>>> getAllCatsByBreed(String breed) async {
    List<Map<String, dynamic>> cats = [];
    await FirebaseFirestore.instance
        .collection('cats')
        .where('cat_breed', isEqualTo: breed)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        cats.add(element.data());
      });
    });
    return cats;
  }

  /// A get method to return information about the injury of a specific stray cat 
  static Future<Map<String, dynamic>> getInjuryInfo(int id) async {
    Map<String, dynamic> injury = {};
    await FirebaseFirestore.instance
        .collection('injuries')
        .where('cat_id', isEqualTo: id)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        injury.update('cat_id', (value) => result.data()['cat_id']);
        injury.update('injury_desc', (value) => result.data()['injury_desc']);
        injury.update('injury_img', (value) => result.data()['injury_img']);
        injury.update('passerby_hp', (value) => result.data()['passerby_hp']);
        injury.update('passerby_name', (value) => result.data()['passerby_name']);
        injury.update('cat_name', (value) => result.data()['cat_name']);
        injury.update('lastSeen', (value) => result.data()['lastSeen']);
      });
    });
    return injury;
  }

  /// A get method to return all injured stray cats
  static Future<List<Map<String, dynamic>>> getAllInjuredCats() async {
    List<Map<String, dynamic>> injuredCats = []; // holds all injured cats to be returned
    List injuredCatID = []; // holds all the cat id of injured cats
   await  FirebaseFirestore.instance.collection('injuries').get().then((value) {
      value.docs.forEach((element) {
        injuredCatID.add(element.data()['cat_id']);
      });
    });
    for (int id in injuredCatID) {
      FirebaseFirestore.instance
          .collection('cats')
          .where('cat_id', isEqualTo: id)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          injuredCats.add(element.data());
        });
      });
    }
    return injuredCats;
  }

  /// A method to update the last seen location of an existing stray cat stored in the Firebase Cloud Firestore
  static Future<void> updateLocation(int id, GeoPoint newLoc) async {
    await cats
        .doc(id.toString())
        .update({'lastSeenLoc': newLoc})
        .then((value) => print("Location updated"))
        .catchError((error) => print("Failed to update location: $error"));
  }

  /// A method to update the profile photo of an existing stray cat stored in the Firebase Cloud Firestore
  Future<void> updatePhoto(int id, String newURL) async {
    String oldURL = '';
    await FirebaseFirestore.instance
        .collection('cats').where('cat_id', isEqualTo: id)
        .get()
        .then((value) {
          value.docs.forEach((result) {
            oldURL = result.data()['img_URL'];
            print('oldURL is: $oldURL');
          });
    }).catchError((error)=> print("Failed to retrieve oldURL: $error"));
    ImageMngr.deleteImg(oldURL);
    await cats
        .doc(id.toString())
        .update({'img_URL': newURL})
        .then((value) => print("Cat photo updated"))
        .catchError((error) => print("Failed to update cat photo: $error"));
  }

  /// A method to update the injury status of an existing stray cat stored in the Firebase Cloud Firestore
  static Future<void> updateStatus(int id, bool newStatus) async {
    await cats
        .doc(id.toString())
        .update({'is_injured': newStatus})
        .then((value) => print("Injury status updated"))
        .catchError((error) => print("Failed to update injury status: $error"));
  }

  /// A get method to return the image URL of a stray cat
  static Future<String> getImgURL(int id) async{
    String img = '';
    final i = await FirebaseFirestore.instance
        .collection('cats')
        .where('cat_id', isEqualTo: id)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        img = element.data()['img_URL'];
      });
    });
    return img;
  }

}
