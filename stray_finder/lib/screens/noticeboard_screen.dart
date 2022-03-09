import 'package:flutter/material.dart';
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
  var strayCats = [StrayCat(id: "1", name: "Betty", contact: "98765432", condition: "")];

  void _removeInjured(String id){
    setState(() {
      strayCats.removeWhere((cat) => cat.id==id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return strayCats.isEmpty
    ? Column(
        children: [
          Text(
            'No injured cats :)',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 200,
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover,
            )
          ),
        ],
      )
    : ListView.builder(
        itemCount: strayCats.length,
        itemBuilder: (context, ind){
          var cat = strayCats[ind];
          return InjuredCatCard(cat, _removeInjured);
        }
      );
  }
}
