import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../managers/InjuryMngr.dart';
import '../ui/ReportUI.dart';
import '../managers/StrayCatMngr.dart';
import '../ui/MapUI.dart';

///A page that prompts the user to give the app access to their location and also ask the user to specify if the cat found is injured or not
class AskIfInjuredPage extends StatefulWidget {
  const AskIfInjuredPage({Key? key}) : super(key: key);

  @override
  State<AskIfInjuredPage> createState() => _AskIfInjuredPageState();
}

/// State of the page
class _AskIfInjuredPageState extends State<AskIfInjuredPage> {

  /// An attribute to determine if the icon changes colour or not
  bool iconGlow = false;

  /// An attribute to determine if the location of the user has been collected by the app or not
  bool isConfirm = false;

  /// An attribute to determine if the asking injured widgets will appear or not
  bool isPop = false;

  /// An attribute to determine if the text field (to manually input location) is disabled or enabled
  bool isTextFieldDisabled = false;

  /// An attribute to collect the user's location in GeoPoint
  late GeoPoint finalLoc;

  ///An attribute for the user to input their postal code manually
  late String location;

  ///A controller to control the text fields
  final myController = TextEditingController();

  void initState() {
    super.initState();
    myController.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty) {
          isConfirm = true;
        }
        else {
          isConfirm = false;
        }
      });
    });
  }
  @override

  ///A method to build the page
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
                    child: Image.network(image, height: 200,
                        width: 200),
                  ),
                ),
                (isPop == false) ? Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: const Text("Please enable StrayFinder to access your location by clicking on the icon below or by entering your current location's address to proceed with the report", textAlign: TextAlign.center, style: TextStyle(fontSize: 18,
                        fontFamily: "Poppins"),)
                ) :
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: const Text('Is the cat injured?', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontFamily: "Poppins"),)
                ),
                (myController.text.isNotEmpty && isPop == false) ? Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 40, 10),
                  child: IconButton(icon: Icon(Icons.location_off, color: Colors.grey, size: 50,), onPressed: null),
                ):
                (isPop == false && iconGlow == false) ? Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 40, 10),
                  child: IconButton(icon: Icon(Icons.location_on, color: Color(0xff754E46), size: 50,), onPressed: ()async
                   {
                     try {
                      Position temp = await MapUI.getCurrentLocation();
                      finalLoc = GeoPoint(temp.latitude, temp.longitude);
                      setState(() {
                       iconGlow = true;
                       isConfirm = true;
                       isTextFieldDisabled= true;
                      });
                     } catch (e) {
                       showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text("Location Access Denied"),
                          content: Text("Please give access to your current location in settings or manully input a postal code"),
                          actions: [
                            TextButton(
                              onPressed: ()=>Navigator.pop(ctx),
                              child: Text("OK",
                                style: TextStyle(color: Color(0xff754E46))),
                            )
                          ],
                        );
                      },
                    );
                     }
                   }),
                ) :
                (isPop == false && iconGlow == true) ? Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 40, 10),
                  child: IconButton(icon: Icon(Icons.location_on, color: Colors.blue, size: 50,), onPressed: () async
                  {
                    try {
                      Position temp = await MapUI.getCurrentLocation();
                      finalLoc = GeoPoint(temp.latitude, temp.longitude);
                      setState(() {
                       iconGlow = true;
                       isConfirm = true;
                       isTextFieldDisabled= true;
                      });
                     } catch (e) {
                       showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text("Location Access Denied"),
                          content: Text("Please give access to your current location in settings or manully input a postal code"),
                          actions: [
                            TextButton(
                              onPressed: ()=>Navigator.pop(ctx),
                              child: Text("OK",
                                style: TextStyle(color: Color(0xff754E46))),
                            )
                          ],
                        );
                      },
                    );
                     }
                  }),
                ):

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                      child: IconButton(icon: Icon(Icons.check_circle, color: Color(0xFF3CAC23), size: 50,),
                          onPressed: () async {
                        if (isExisting == true)
                        {
                          bool exists = await InjuryMngr.checkInjury(id);
                          if (exists){await InjuryMngr.deleteInjury(id);}
                          await StrayCatMngr.updateStatus(id, true);
                          await StrayCatMngr.updateLocation(id, finalLoc);
                        }
                        else
                          {
                            await StrayCatMngr.addCat(id, name, breed, true, finalLoc, image);}


                          ReportUI.goDescribeInjury(context, id, name, finalLoc);}
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                      child: IconButton(icon: Icon(Icons.cancel, color: Color(0xFFC82626), size: 50,), onPressed: () async{
                        if (isExisting == true)
                        {
                          bool exists = await InjuryMngr.checkInjury(id);
                          if (exists){await InjuryMngr.deleteInjury(id);}
                          await StrayCatMngr.updateStatus(id, false);
                          await StrayCatMngr.updateLocation(id, finalLoc);
                        }
                        else
                        {
                          await StrayCatMngr.addCat(id, name, breed, false, finalLoc, image);}


                        ReportUI.goDescribeInjury(context, id, name, finalLoc);

                        ReportUI.goThankYouForReporting(context);
                      },),
                    ),
                  ],
                ),
                (isPop == false) ? Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: const Text("OR", textAlign: TextAlign.center, style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),)
                ) : Container(),
                (isPop == false && isTextFieldDisabled == false) ? Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextField(
                    controller: myController,
                      cursorColor: Color(0xff754E46),
                      onChanged: (value) {
                        location = value;
                        // add exceotion handling
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff754E46)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff754E46)),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter your current location's postal code",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff754E46), width: 2.0)),
                      ),
                      style: TextStyle(color: Colors.black)


                  ),
                ) :
                (isPop == false && isTextFieldDisabled == true) ?
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextField(
                      controller: myController,
                      cursorColor: Color(0xff754E46),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff754E46)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff754E46)),
                        ),
                        fillColor: Colors.white,
                        enabled: false,
                        filled: true,
                        hintText: "Enter your current location's postal code",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff754E46), width: 2.0)),
                      ),
                      style: TextStyle(color: Colors.black)


                  ),
                )

                    :
                Container(),

                (isPop == false) ? Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 100),
                  child:
                  (isConfirm == true && myController.text.trim().isEmpty) ? TextButton(
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
                  ) :
                  (myController.text.trim().isNotEmpty)?
                  TextButton(
                    onPressed: () async {
                      // method to change address to location
                      // print("location: " + location);
                      if (location.length != 6 || int.tryParse(location.substring(0,2))! <= 0 || int.tryParse(location.substring(0,2))! > 82 ){
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Incorrect postal code entered!"),
                              actions: [
                                TextButton(
                                  onPressed: ()=>Navigator.pop(ctx),
                                  child: Text("OK",
                                    style: TextStyle(color: Color(0xff754E46))),
                                )
                              ],
                            );
                          },
                        );
                      } else{
                        finalLoc = await MapUI.geoCode(location);
                        setState(() {
                          isPop = true;
                        });
                      }
                    },
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

///A method to show alert dialog when there is an error 
showAlertDialog(BuildContext context, String title, String content) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/register');
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