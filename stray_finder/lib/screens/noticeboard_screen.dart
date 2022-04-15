import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stray_finder/managers/cat_manager.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../classes/stray_cat.dart';
import '../widgets/injured_cat.dart';

class NoticeboardWidget extends StatefulWidget {
  // const NoticeboardWidget({Key key}) : super(key: key);

  @override
  _NoticeboardWidgetState createState() => _NoticeboardWidgetState();
}

class _NoticeboardWidgetState extends State<NoticeboardWidget> {
  // StrayCatMngr.getInjured() = []
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CatMngr.init();
  }
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

    // return strayCats.isEmpty
    // ? Column(
    //     children: [
    //       Text(
    //         'No injured cats :)',
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //       const SizedBox(
    //         height: 50,
    //       ),
    //       Container(
    //         height: 200,
    //         child: Image.asset(
    //           "assets/images/waiting.png",
    //           fit: BoxFit.cover,
    //         )
    //       ),
    //     ],
    //   )
    // : ListView.builder(
    //     itemCount: strayCats.length,
    //     itemBuilder: (context, ind){
    //       var cat = strayCats[ind];
    //       return InjuredCatCard(cat, _removeInjured);
    //     }
    //   );
  }

  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => true;
}
