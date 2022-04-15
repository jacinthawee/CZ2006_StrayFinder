import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../ui/ReportUI.dart';
import '../classes/StrayCatMngr.dart';

class AskIfInjuredPage extends StatefulWidget {
  const AskIfInjuredPage({Key? key}) : super(key: key);

  @override
  State<AskIfInjuredPage> createState() => _AskIfInjuredPageState();
}

class _AskIfInjuredPageState extends State<AskIfInjuredPage> {
  bool iconGlow = false;
  bool isConfirm = false;
  bool isPop = false;
  Position? finalLoc;

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final name = routeArgs['name'];
    final breed = routeArgs['breed'];
    final image = routeArgs['image'];
    final isExisting = routeArgs['is_existing'];
    return Scaffold(

        appBar: AppBar(
          // leading: BackButton(onPressed:  () {
          //   Navigator.pushNamed(
          //     context,
          //     '/isthisthecat',
          //   );
          // }),
          automaticallyImplyLeading: false,
          title: Text(
            "Report",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),

        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Text('You Found $name!', textAlign: TextAlign.center, style: TextStyle(fontSize: 25,
                        fontFamily: "Poppins"),)
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      )),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  margin: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(image, height: 300,
                        width: 300),
                  ),
                ),
                (isPop == false) ? Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: const Text("Please enable StrayFinder to access your location by clicking on the icon below to proceed with the report", textAlign: TextAlign.center, style: TextStyle(fontSize: 18,
                        fontFamily: "Poppins"),)
                ) :
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: const Text('Is the cat injured?', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontFamily: "Poppins"),)
                ),
                (isPop == false && iconGlow == false) ? Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 40, 10),
                  child: IconButton(icon: Icon(Icons.location_on, color: Color(0xff754E46), size: 50,), onPressed: ()async
                   {

                     Position? loc = await ReportUI.getCurrentLocation();
                     if (loc != null)
                     {setState(() {
                       iconGlow = true;
                       isConfirm = true;
                       finalLoc = loc;
                     });
                     }
                     else{
                       showAlertDialog(context);
                     }
                   }),
                ) :

                (isPop == false && iconGlow == true) ? Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 40, 10),
                  child: IconButton(icon: Icon(Icons.location_on, color: Colors.blue, size: 50,), onPressed: () async
                  {
                    Position? loc = await ReportUI.getCurrentLocation();
                      if (loc != null)
                        {setState(() {
                        iconGlow = true;
                        isConfirm = true;
                        finalLoc = loc;
                      });
                    }
                    else{
                      showAlertDialog(context);
                  }}),
                ):

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                      child: IconButton(icon: Icon(Icons.check_circle, color: Color(0xFF3CAC23), size: 50,),
                          onPressed: () {
                        if (isExisting == true)
                          {StrayCatMngr().updateStatus(id, true);}
                        else
                          {StrayCatMngr().addCat(id, name, breed, true, GeoPoint(finalLoc!.latitude, finalLoc!.longitude), image);}


                          ReportUI.goDescribeInjury(context, id, name, GeoPoint(finalLoc!.latitude, finalLoc!.longitude));}
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                      child: IconButton(icon: Icon(Icons.cancel, color: Color(0xFFC82626), size: 50,), onPressed: () {
                        if (isExisting == true)
                        {StrayCatMngr().updateStatus(id, false);
                        StrayCatMngr().updateLocation(id, GeoPoint(finalLoc!.latitude, finalLoc!.longitude));
                        }
                        else
                        {StrayCatMngr().addCat(id, name, breed, false, GeoPoint(finalLoc!.latitude, finalLoc!.longitude), image);}


                        ReportUI.goDescribeInjury(context, id, name, GeoPoint(finalLoc!.latitude, finalLoc!.longitude));

                        ReportUI.goThankYouForReporting(context);
                      },),
                    ),
                  ],
                ),

                (isPop == false) ? Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 100),
                  child:
                  (isConfirm == true) ? TextButton(
                    onPressed: () {
                      setState(() {
                        isPop = true;
                      });},
                    style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff754E46)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(0, 10, 0, 10)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)))),
                    child: Center(
                      child: Text('Confirm',
                          style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                    ),
                  )


:
                  TextButton(
                    onPressed:null,
                    style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(0, 10, 0, 10)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)))),
                    child: Center(
                      child: Text('Confirm',
                          style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                    ),
                  )
                  ,
                ) : Container(),

              ],

            ),



          ),
        ));
  }
}


showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/askifinjured');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("Location not detected. Please give this app access to your location!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}