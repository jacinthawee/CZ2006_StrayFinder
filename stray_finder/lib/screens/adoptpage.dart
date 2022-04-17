import 'package:flutter/material.dart';
import '../classes/AdoptOrg.dart';
import '../widgets/AdoptWidget.dart';
import '../managers/AdoptManager.dart';


/// A page that consists of a list of adoption agencies 
class AdoptPage extends StatelessWidget {
  const AdoptPage({ Key? key }) : super(key: key);

  @override

  ///A method to build the page
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
