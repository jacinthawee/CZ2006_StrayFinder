import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../classes/AdoptOrg.dart';
import '../widgets/adopt.dart';
import '../managers/AdoptManager.dart';

class AdoptPage extends StatefulWidget {
  // const NoticeboardWidget({Key key}) : super(key: key);

  @override
  _AdoptState createState() => _AdoptState();
}

class _AdoptState extends State<AdoptPage> {


  var adoptionCentres = AdoptMngr.getAdoptionCentres();
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: adoptionCentres.length,
        itemBuilder: (context, ind){
          var adoptionagency = adoptionCentres[ind];
          return Adopt(adoptionagency);
        }
    );
  }
}
