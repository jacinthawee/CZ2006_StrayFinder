import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

class VetWidget extends StatefulWidget {
  // const VetWidget({Key key}) : super(key: key);

  @override
  _VetWidgetState createState() => _VetWidgetState();
}

class _VetWidgetState extends State<VetWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Text("Vets");
    // return Scaffold(
    //   key: scaffoldKey,
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).primaryColor,
    //     automaticallyImplyLeading: false,
    //     title: const Text(
    //       'Vets',
    //     ),
    //     actions: [],
    //     centerTitle: true,
    //     elevation: 4,
    //   ),
    //   backgroundColor: Color(0xFFF5F5F5),
    // );
  }
}
