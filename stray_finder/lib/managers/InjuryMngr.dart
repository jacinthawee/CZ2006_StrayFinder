import 'package:cloud_firestore/cloud_firestore.dart';
import './StrayCatMngr.dart';
import './ImageMngr.dart';

class InjuryMngr {
  static CollectionReference injuries = FirebaseFirestore.instance.collection('injuries');

  static Future<void> addInjury(int catid, String description, List<String> photos, String passerbyContact, String passerbyName, String catName, GeoPoint lastSeen){
    return injuries
        .doc(catid.toString())
        .set({
      'cat_id': catid,
      'injury_desc': description,
      'injury_img': photos,
      'passerby_hp': passerbyContact,
      'passerby_name': passerbyName,
      'cat_name': catName,
      'lastSeen': lastSeen
    })
        .then((value) => print("Injury Added"))
        .catchError((error) => print("Failed to add injury: $error"));
  }

  static Future<void> deleteInjury(int catid) async{
    // 1. delete images of injury
    List<String> delImgs = [];
    await FirebaseFirestore.instance
        .collection('injuries')
        .where('cat_id', isEqualTo: catid)
        .get()
        .then((value) {
      value.docs.forEach((result){
        result.data()['injury_img'].forEach((url){
          delImgs.add(url.toString());
        });
        print('successfully retrieved images to be deleted');
      });
    });
    print(delImgs);
    for (var img in delImgs){
      ImageMngr.deleteImg(img);
    }
    print('deletion of all images complete');
    // 2. update injury status to false
    StrayCatMngr.updateStatus(catid, false);
    // 3. delete the injury itself
    await FirebaseFirestore.instance
        .collection('injuries')
        .doc(catid.toString())
        .delete()
        .then((value) => print("Injury Deleted"))
        .catchError((error) => print("Failed to delete injury: $error"));
  }

  static Future<String> getContact(int catid) async{
    String contact = '';
    final c = await FirebaseFirestore.instance
        .collection('injuries')
        .where('cat_id', isEqualTo: catid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        contact = element.data()['passerby_hp'];
      });
    });
    return contact;
  }

  static Future<bool> checkInjury(int catid) async{
    var result = await FirebaseFirestore.instance
    .collection('injuries')
    .doc(catid.toString()).get();
    if (result.exists) return true;
    else return false;
  }

}