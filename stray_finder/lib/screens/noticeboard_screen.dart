import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/injured_cat.dart';

class NoticeboardScreen extends StatefulWidget {
  @override
  _NoticeboardScreenState createState() => _NoticeboardScreenState();
}

class _NoticeboardScreenState extends State<NoticeboardScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('injuries').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasData){
          List<QueryDocumentSnapshot<Map<String, dynamic>>> injuredCats = snapshot.data!.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
          return injuredCats.isEmpty ?
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 50, 40, 0),
            child: Center(
              child: Text(
                'No injured cats found',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  color: Colors.black
                ),
              ),
            ),
          )
          : ListView.builder(
            itemCount: injuredCats.length,
            itemBuilder: (context, ind){
              var cat = injuredCats[ind].data();
              return InjuredCatCard(cat);
            }
          );
        } else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
