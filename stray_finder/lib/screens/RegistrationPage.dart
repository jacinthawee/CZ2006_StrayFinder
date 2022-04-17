import 'package:flutter/material.dart';
import '../managers/RegisterMngr.dart';
import '../ui/RegisterUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../managers/UserVolunteerMngr.dart';

/// Registrition page
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

/// state of the page
class _RegistrationPageState extends State<RegistrationPage> {
  /// FirebaseAuth instance to help register a user
  final _auth = FirebaseAuth.instance;
  /// user's input email
  late String email;
  /// user's input password
  late String password;
  /// user's input contact number
  late String contactno;
  /// user's input organization name
  late String orgname;
  /// user's input address
  late String address;
  /// whether to show spinner when the registrition is loading
  bool showSpinner = false;
  /// to show/hide the input password
  bool _isHiddenPassword = true;
  /// controller for email text field
  final myController = TextEditingController();
  /// controller for password text field
  final myController1 = TextEditingController();
  /// controller for contact number text field
  final myController2 = TextEditingController();
  /// controller for orgnization name text field
  final myController3 = TextEditingController();
  /// controller for address text field
  final myController4 = TextEditingController();
  /// whether the user click register button
  bool submit = false;

  /// a method to control the show/hide password
  void _togglePassword() {
  }

  /// build the page
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
                                orgname = value;
                              },
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
                                  email = value;
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
                                password = value;
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
                                contactno = value;
                              },
                              cursorColor: Color(0xff754E46),
                              keyboardType: TextInputType.number,
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
                                address = value;
                              },
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

                      if (await UserVolunteerMngr.checkDupName(orgname) == false)
                      {
                        try {



                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        UserVolunteerMngr.addUser(email, contactno, orgname, address);
                        if (newUser != null) {
                          Navigator.pushNamed(context, '/login');
                        }
                      } catch (e) {
                        final errorMsg = RegisterMngr.generateExceptionMessage(RegisterMngr.handleException(e));
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
/// show dialog box for error message
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
