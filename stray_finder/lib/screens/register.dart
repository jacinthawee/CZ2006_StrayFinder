// import 'package:cz2006_test/screens/auth-exception-handler.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './auth-exception-handler.dart';
import '../ui/RegisterUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../classes/UserVolunteer.dart';


import 'authentication.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String contactno;
  late String orgname;
  late String address;


  bool showSpinner = false;
  bool _isHiddenPassword = true;
  void _togglePassword() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  bool submit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController1.text.isNotEmpty && myController2.text.isNotEmpty && myController3.text.length == 8 && myController4.text.isNotEmpty)
          {submit = true;}
        else
          {submit = false;}
      });
    });
    myController1.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController1.text.isNotEmpty && myController2.text.isNotEmpty && myController3.text.length == 8  && myController4.text.isNotEmpty)
        {submit = true;}
        else
        {submit = false;}
      });
    }
    );
    myController2.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController1.text.isNotEmpty && myController2.text.isNotEmpty && myController3.text.length == 8  && myController4.text.isNotEmpty)
        {submit = true;}
        else
        {submit = false;}
      });
    }
    );
    myController3.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController1.text.isNotEmpty && myController2.text.isNotEmpty && myController3.text.length == 8  && myController4.text.isNotEmpty)
        {submit = true;}
        else
        {submit = false;}
      });
    }
    );
    myController4.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController1.text.isNotEmpty && myController2.text.isNotEmpty && myController3.text.length == 8  && myController4.text.isNotEmpty)
        {submit = true;}
        else
        {submit = false;}
      });
    }
    );
  }
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Register",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: ListView(children: [
            Row(
              children: [
                new Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 100, 10, 0),
                    child: Text("Organization Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                  ),
                ),
                new Flexible(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 100, 20, 0),
                      child: SizedBox(
                        height: 70.0,
                        child: Theme(
                          data:Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary:Colors.brown,
                            ),
                          ),
                          child: TextField(
                            controller: myController,
                              onChanged: (value) {
                                // setState(() {
                                //   var _newMessage = value;
                                //
                                //   if(_newMessage.length > 0){  //add these lines
                                //     isInputEmpty5 = false;
                                //   } else if (_newMessage.length == 0){
                                //     isInputEmpty5 = true;
                                //   }
                                //
                                // });
                                orgname = value;
                                //Do something with the user input.
                              },
    // onChanged: (value) {
    // email = value;
    // //Do something with the user input.
    // },
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return "Please enter your organization's name";
                              //   }
                              //   return null;
                              // },
                              // controller: _orgnameController,
                              cursorColor: Color(0xff754E46),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
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
                                        color: Color(0xff754E46), width: 2.0)),
                              ),
                              style: TextStyle(color: Colors.black)),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                new Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(80, 10, 54, 0),
                    child: Text("Email",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                  ),
                ),
                new Flexible(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: SizedBox(
                        height: 70.0,
                        child: Theme(
                          data:Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary:Colors.brown,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: TextField(
                                controller: myController1,
                                onChanged: (value) {
                                  // setState(() {
                                  //   var _newMessage = value;
                                  //
                                  //   if(_newMessage.length > 0){  //add these lines
                                  //     isInputEmpty4 = false;
                                  //   } else if (_newMessage.length == 0){
                                  //     isInputEmpty4 = true;
                                  //   }
                                  //
                                  // });
                                  email = value;
                                  //Do something with the user input.
                                },
                                cursorColor: Color(0xff754E46),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff754E46)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff754E46)),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: '',
                                  hintText: 'example@123.com',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff754E46), width: 2.0)),
                                ),
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                new Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 10, 54, 0),
                    child: Text("Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                  ),
                ),
                new Flexible(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: SizedBox(
                        height: 70.0,
                        width: 600,
                        child: Theme(
                          data:Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary:Colors.brown,
                            ),
                          ),
                          child: TextField(
                              controller: myController2,
                              onChanged: (value) {
                                // setState(() {
                                //   var _newMessage = value;
                                //
                                //   if(_newMessage.length > 0){  //add these lines
                                //     isInputEmpty3 = false;
                                //   } else if (_newMessage.length == 0){
                                //     isInputEmpty3 = true;
                                //   }
                                //
                                // });
                                password = value;
                                //Do something with the user input.
                              },
                              obscureText: _isHiddenPassword,
                              cursorColor: Color(0xff754E46),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.security),
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
                                        color: Color(0xff754E46), width: 2.0)),
                                suffixIcon: GestureDetector(
                                  onTap: _togglePassword,
                                  child: Icon(
                                    _isHiddenPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              style: TextStyle(color: Colors.black)),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                new Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(33, 15, 20, 0),
                    child: Text("Contact Number",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                  ),
                ),
                new Flexible(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: SizedBox(
                        height: 70.0,
                        child: Theme(
                          data:Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary:Colors.brown,
                            ),
                          ),
                          child: TextField(
                              controller: myController3,
                              onChanged: (value) {
                                // setState(() {
                                //   var _newMessage = value;
                                //
                                //   if(_newMessage.length > 0){  //add these lines
                                //     isInputEmpty1 = false;
                                //   } else if (_newMessage.length == 0){
                                //     isInputEmpty1 = true;
                                //   }
                                //
                                // });
                                contactno = value;
                                //Do something with the user input.
                              },
                              // onSaved: (val) {
                              //   contactno = val;
                              // },
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter some name';
                              //   }
                              //   return null;
                              // },
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return "Please enter your contact number";
                              //   }
                              //   return null;
                              // },
                              // controller: _contactnoController,
                              cursorColor: Color(0xff754E46),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.call),
                                hintText: 'E.g. 12345678',

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: '+65',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff754E46), width: 2.0)),
                              ),
                              style: TextStyle(color: Colors.black)),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                new Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 0, 50, 0),
                    child: Text("Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19, fontFamily: "Poppins")),
                  ),
                ),
                new Flexible(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 20, 12, 0),
                      child: SizedBox(
                        height: 80.0,
                        child: Theme(
                          data:Theme.of(context).copyWith(
                            colorScheme: ThemeData().colorScheme.copyWith(
                              primary:Colors.brown,
                            ),
                          ),
                          child: TextField(
                              controller: myController4,
                              onChanged: (value) {

                                // setState(() {
                                //
                                //
                                //   var _newMessage = value;
                                //
                                //   if(_newMessage.length > 0){  //add these lines
                                //     isInputEmpty2 = false;
                                //   } else {
                                //     isInputEmpty2 = true;
                                //   }
                                //
                                // });
                                address = value;
                                //Do something with the user input.
                              },
                              // onSaved: (val) {
                              //   address = val;
                              // },
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter some name';
                              //   }
                              //   return null;
                              // },
                              maxLines: 12,
                              cursorColor: Color(0xff754E46),
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.house),
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
                                        color: Color(0xff754E46), width: 2.0)),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      )),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: TextButton(
                    onPressed:
                    (submit == true)?
                    ()  async {

                      
                      setState(() {

                        showSpinner = true;
                      });

                      if (await UserVolunteer().checkDupName(orgname) == false)
                      {
                        try {



                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        UserVolunteer().addUser(email, contactno, orgname, address);


    //     .then(
    // (value) async {
    // var userUpdateInfo = new UserUpdateInfo(); //create user update object
    // userUpdateInfo.address = address;
    // await value.user.updateProfile(userUpdateInfo); //update to firebase
    // await value.user.reload();

                        if (newUser != null) {
                          Navigator.pushNamed(context, '/login');
                        }
                      } catch (e) {
                        final errorMsg = AuthExceptionHandler.generateExceptionMessage(AuthExceptionHandler.handleException(e));
                        showAlertDialog(context, errorMsg, "Error");
                      }
                      setState(() {
                        showSpinner = false;
                      });

                    }
                    else{
                      showAlertDialog(context, "Organization name is duplicate. Please login to your existing account!", "Error");
                      setState(() {

                        showSpinner = false;
                      });
                    }
                    }
                    
                    
                     : null,
                    style: ButtonStyle(

                        foregroundColor:
                        (submit == true)? MaterialStateProperty.all<Color>(Colors.white):
                        MaterialStateProperty.all<Color>(Colors.white)
                        ,
                        backgroundColor:
                        (submit == true) ?MaterialStateProperty.all<Color>(Color(0xff754E46)):
                        MaterialStateProperty.all<Color>(Colors.grey),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(55, 10, 55, 10)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)))),
                    child: Text('Register',
                        style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                  ),
                ),
            Padding(
                padding: EdgeInsets.fromLTRB(163, 40, 30, 0),
                child: Text("Already a user?",
                    style: TextStyle(fontSize: 12, fontFamily: "Poppins"))),
            Row(children: [
              new Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(177, 3, 0, 0),
                  child: Text("Click",
                      style: TextStyle(fontSize: 12, fontFamily: "Poppins")),
                ),
              ),
              new Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
                  child: GestureDetector(
                    child: Text("here",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.underline)),
                    onTap: () {
                      RegisterUI.goLogin(context);
                    },
                  ),
                ),
              ),
            ])
          ]),
        ));
  }
}

showAlertDialog(BuildContext context, String e, String a) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/register');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(a),
    content: Text(e),
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
