import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import '../ui/ReportUI.dart';
import '../managers/UserVolunteerMngr.dart';

class CustomiseProfile extends StatefulWidget {
  @override
  State<CustomiseProfile> createState() => _CustomiseProfileState();
}

class _CustomiseProfileState extends State<CustomiseProfile> {
  String? newAddr;
  String? newName;
  String? newContact;
  bool isEdited = false;

  void _disableButton() {
    setState(() {
      isEdited = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    newAddr ??= routeArgs['org_address'];
    newName ??= routeArgs['org_name'];
    newContact ??= routeArgs['user_contact'];
    String email = routeArgs['user_email'];
    

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: isEdited ? null : _disableButton,
              icon: const Icon(Icons.edit),
            ),
          ],
          title: Center(
            child: Text(
              "Edit Profile",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ),
        body: ListView(children: [
          Row(
            children: [
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 80, 10, 0),
                  child: Text("Organization Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 20, 0),
                    child: SizedBox(
                      height: 70.0,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ThemeData().colorScheme.copyWith(
                            primary: Colors.brown,
                          ),
                        ),
                        child: TextFormField(
                          enabled: isEdited,
                          onChanged: (value) {
                            newName = value.trim();
                          },
                          initialValue: newName,
                          cursorColor: const Color(0xff754E46),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff754E46)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff754E46)),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff754E46),
                                width: 2.0,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    )
                  ),
              ),
            ],
          ),
          Row(
            children: [
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(33, 15, 20, 0),
                  child: Text("Contact Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: SizedBox(
                      height: 70.0,
                      child: Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ThemeData().colorScheme.copyWith(
                                      primary: Colors.brown,
                                    ),
                              ),
                              child: TextFormField(
                                enabled: isEdited,
                                  onChanged: (value) {
                                    newContact = value.trim();
                                    // print(newContact);
                                  },
                                  initialValue: newContact,
                                  // controller: myController2,
                                  cursorColor: Color(0xff754E46),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.call),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff754E46)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff754E46)),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "E.g. 12345678",
                                    labelText: '+65',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff754E46),
                                            width: 2.0)),
                                  ),
                                  style: TextStyle(color: Colors.black)),
                            )
                    )),
              ),
            ],
          ),
          Row(
            children: [
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(65, 0, 59, 0),
                  child: Text("Address",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 15, 0),
                    child: SizedBox(
                      height: 80.0,
                      child: Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ThemeData().colorScheme.copyWith(
                                      primary: Colors.brown,
                                    ),
                              ),
                              child: TextFormField(
                                enabled: isEdited,
                                  // controller: myController1,
                                  onChanged: (value) {
                                    newAddr = value.trim();
                                  },
                                  initialValue:
                                      newAddr,
                                  maxLines: 12,
                                  cursorColor: const Color(0xff754E46),
                                  keyboardType: TextInputType.streetAddress,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.house),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff754E46)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff754E46)),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: '',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff754E46),
                                            width: 2.0)),
                                  ),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  )),
                            )
                    )),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: (isEdited == true)
                  ? TextButton(
                      onPressed: () async {
                        if (newName! == routeArgs['org_name'] && newContact! == routeArgs['user_contact'] && newAddr! == routeArgs['org_address']){
                          showAlertDialog(
                              context,
                              "No information updated.",
                              "Success");
                          setState(() {
                            isEdited = false;
                          });
                        } else if (int.tryParse(newContact!)==null){
                          showAlertDialog(
                              context,
                              "Please enter numbers only for contact!",
                              "Error");
                        } else if (await UserVolunteerMngr.checkDupName(newName!) == true && newName! != routeArgs['org_name']){
                          showAlertDialog(
                              context,
                              "Duplicate organization name! Please enter a new one.",
                              "Error");
                        } else if (newAddr!.isEmpty || newName!.isEmpty ||newContact!.isEmpty) {
                          showAlertDialog(context,
                              "Please fill in all fields!", "Error");
                        } else if (newContact!.length != 8) {
                          showAlertDialog(
                              context,
                              "Please only enter 8 digits for your contact number!",
                              "Error");
                        } else {
                          UserVolunteerMngr
                              .editProfile(email, newName!, newContact!, newAddr!);

                          showAlertDialog(
                              context,
                              "Your profile has been successfully updated!",
                              "Success");

                          setState(() {
                            isEdited = false;
                          });
                        }
                      },
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff754E46)),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.fromLTRB(55, 10, 55, 10)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)))),
                      child: const Text('Confirm',
                          style:
                              TextStyle(fontSize: 20, fontFamily: "Poppins")),
                    )
                  : Container()),
        ]));
  }
}

showAlertDialog(BuildContext context, String text, String title) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/customiseprofile');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(text),
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
