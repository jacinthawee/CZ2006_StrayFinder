import 'package:cloud_firestore/cloud_firestore.dart';

class Queries{
  CollectionReference cats = FirebaseFirestore.instance.collection('cats');

  Future<String?> getCatName(int catID) async{
    String name;
    final q = await FirebaseFirestore.instance.collection('cats')
        .where('cat_id', isEqualTo: catID)
        .get();
    for (var doc in q.docs){
      String name = doc.get('cat_name');
      return name;
    }
  }

  void getCatBreed(String breed) {
    FirebaseFirestore.instance.collection('cats')
        .where('cat_breed', isEqualTo: breed)
        .get()
        .then((value){
      value.docs.forEach((result) {
        print(result.data()['cat_breed']);
      });
    });
  }

  void getStatusInjury(int catID) {
    FirebaseFirestore.instance.collection('cats')
        .where('cat_id', isEqualTo: catID)
        .get()
        .then((value){
      value.docs.forEach((result) {
        print(result.data()['is_injured']);
      });
    });
  }

  void getContactNo(int catID) {
    FirebaseFirestore.instance.collection('cats')
        .where('cat_id', isEqualTo: catID)
        .get()
        .then((value){
      value.docs.forEach((result) {
        print(result.data()['passerby_contact']);
      });
    });
  }
}



