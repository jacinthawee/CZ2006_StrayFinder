import 'package:flutter/material.dart';
import '../ui/ReportUI.dart';
import '../managers/InjuryMngr.dart';

class BringCatToVetPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final desc = routeArgs['description'];
    final images = routeArgs['images'];
    final name = routeArgs['name'];
    final lastSeen = routeArgs['lastSeen'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
         "Report",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 250, 10, 40),
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text('Are you bringing $name to the vet yourself?', style: TextStyle(fontSize: 25, fontFamily: "Poppins"), textAlign: TextAlign.center,)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                  child: IconButton(icon: Icon(Icons.check_circle, color: Color(0xFF3CAC23), size: 50,), onPressed: () {
                    ReportUI.goLeaveContactDetails(context, id, desc, images, name, lastSeen);
                  },),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                  child: IconButton(icon: Icon(Icons.cancel, color: Color(0xFFC82626), size: 50,), onPressed: (){
                    String passerbyContact = 'N/A';
                    String passerbyName = 'N/A';
                    InjuryMngr.addInjury(id, desc, images, passerbyContact, passerbyName, name, lastSeen);
                  ReportUI.goThankYouForReporting(context);
                  },),
                ),
              ],
            ),
          ],
        ),
      ),
      );
  }



}
