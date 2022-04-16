import 'package:cloud_firestore/cloud_firestore.dart';
import 'ImageMngr.dart';
class StrayCatMngr {
  var strayCatList = [];
  static CollectionReference cats = FirebaseFirestore.instance.collection('cats');
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

  static Future<List<Map<String, dynamic>>> getAllCatInfo() async {
    List<Map<String, dynamic>> items = [];
    await FirebaseFirestore.instance.collection('cats').get().then((value) {
      value.docs.forEach((result) {
        items.add(result.data());
      });
    });
    return items;
  }

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

  static Future<List<Map<String, dynamic>>> getAllInjuredCats() async {
    List<Map<String, dynamic>> injuredCats =
        []; // holds all injured cats to be returned
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

  static Future<void> updateLocation(int id, GeoPoint newLoc) async {
    await cats
        .doc(id.toString())
        .update({'lastSeenLoc': newLoc})
        .then((value) => print("Location updated"))
        .catchError((error) => print("Failed to update location: $error"));
  }

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

  static Future<void> updateStatus(int id, bool newStatus) async {
    await cats
        .doc(id.toString())
        .update({'is_injured': newStatus})
        .then((value) => print("Injury status updated"))
        .catchError((error) => print("Failed to update injury status: $error"));
  }

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

// getAllCatLocation() {}
// getInjuredCatID() {}
// getSpecificCatLocation() {}
// manageInjury() {}

}
