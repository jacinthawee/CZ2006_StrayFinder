import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../classes/AdoptOrg.dart';
import '../widgets/adopt.dart';
import '../managers/AdoptManager.dart';

// class AdoptPage extends StatefulWidget {
//   // const NoticeboardWidget({Key key}) : super(key: key);

//   @override
//   _AdoptState createState() => _AdoptState();
// }

// class _AdoptState extends State<AdoptPage> {


//   List<AdoptOrg> adoptionCentres = AdoptMngr.getAdoptionCentres();
//   @override
//   Widget build(BuildContext context) {
//     return  ListView.builder(
//         itemCount: adoptionCentres.length,
//         itemBuilder: (context, ind){
//           var adoptionagency = adoptionCentres[ind];
//           return Adopt(adoptionagency);
//         }
//     );
//   }
// }

class AdoptPage extends StatelessWidget {
  const AdoptPage({ Key? key }) : super(key: key);

<<<<<<< HEAD
=======
  var adoptionCentres = AdoptMngr.getAdoptionCentres();
>>>>>>> 9207b0167cd83bd2a1d4d9f3e611fb50998dfcb3
  @override
  Widget build(BuildContext context) {
    List<AdoptOrg> adoptionCentres = AdoptMngr.getAdoptionCentres();
    return  ListView.builder(
        itemCount: adoptionCentres.length,
        itemBuilder: (context, ind){
          var adoptionagency = adoptionCentres[ind];
          return AdoptWidget(adoptionagency);
        }
    );
  }
}
