import 'package:flutter/material.dart';

import '../ui/ReportUI.dart';
import '../managers/InjuryMngr.dart';

class LeaveContactDetailsPage extends StatefulWidget {
  const LeaveContactDetailsPage({Key? key}) : super(key: key);

  @override
  State<LeaveContactDetailsPage> createState() => _LeaveContactDetailsPageState();
}


class _LeaveContactDetailsPageState extends State<LeaveContactDetailsPage> {


  final myController = TextEditingController();
  final myController2 = TextEditingController();
  bool submit = false;
  late String newName;
  late String contactPasserby;
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController2.text.length == 8) {
          submit = true;
        }
        else {
          submit = false;
        }
      });
    });

    myController2.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController2.text.length == 8) {
          submit = true;
        }
        else {
          submit = false;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final desc = routeArgs['description'];
    final images = routeArgs['images'];
    final name = routeArgs['name'];
    final lastSeen = routeArgs['lastSeen'];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Report",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        body: ListView(
          children: [Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
            child: Text("Please leave your name and contact details so we can hand your case over to a volunteer",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontSize: 25
                )
            ),
          ),
            Padding(
              padding: EdgeInsets.fromLTRB(45, 50, 45, 0),
              child: Container(
                width: 10.0,
                height: 290.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.yellow,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 30, 250, 0),
                      child: Text("Name",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            color: Colors.black
                        ),),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(20, 7, 20, 0),
                        child: Theme(
                          data:Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary:Colors.brown,
                            ),
                          ),
                          child: TextField(
                              controller: myController,
                              onChanged: (value)
                              {newName = value;},
                              cursorColor: Color(0xff754E46),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff754E46), width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter your name',

                              ),
                              style: TextStyle(color: Colors.black, fontFamily: "Poppins")

                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 30, 160, 0),
                      child: Text("Contact Number",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Poppins",
                            color: Colors.black
                        ),),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(20, 7, 20, 0),
                        child: Theme(
                          data:Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary:Colors.brown,
                            ),
                          ),
                          child: TextField(
                              cursorColor: Color(0xff754E46),
                              controller: myController2,
                              onChanged: (value)
                              {contactPasserby = value;},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.call),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff754E46), width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: '+65',
                                hintText: 'e.g. 12345678',

                              ),
                              style: TextStyle(color: Colors.black, fontFamily: "Poppins")

                          ),
                        ))
                  ],
                ),

              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(100, 30, 100, 0)),
            Container(
              width: 100,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: new BoxDecoration(
                color: (submit == true ) ? Color(0xff754E46) : Colors.grey,
                shape: BoxShape.circle,
              ),
              child:
              (submit == true) ? IconButton(onPressed:  () {
                InjuryMngr.addInjury(id, desc, images, contactPasserby, newName, name, lastSeen);
                ReportUI.goThankYouForReporting(context);
              }, icon:
              Icon(Icons.send, color: Colors.white),
                iconSize: 40,
              ) : IconButton(onPressed:  null, icon:
    Icon(Icons.send, color: Colors.white),
    iconSize: 40,
            ),)
          ],
        )
    );
  }
}

