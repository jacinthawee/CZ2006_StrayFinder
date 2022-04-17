import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../ui/LoginUI.dart';


///An attribute that uses Firebase authentication
final FirebaseAuth _auth = FirebaseAuth.instance;

///A page that allows the user to login
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

///State of the app
class _LoginPageState extends State<LoginPage> {

  ///Attribute that indicates the user's email address
  late String email;
   ///Attribute that indicates the user's password
  late String password;
   ///Attribute that controls if the loading spinner is shown or not
  bool showSpinner = false;
   ///Attribute that indicates if the password is hidden or not
  bool _isHidden = true;
   ///Controller that controls the email address textfield
  final myController = TextEditingController();
   ///Attribute that indicates the user's password
  final myController1 = TextEditingController();
  ///Attribute that enables the login button to be enabled or disabled
  bool submit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController1.text.isNotEmpty) {
          submit = true;
        }
        else {
          submit = false;
        }
      });
    });
    myController1.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty && myController1.text.isNotEmpty ) {
          submit = true;
        }
        else {
          submit = false;
        }
      });
    }
    );
  }
  @override


  @override

  ///A method to build the page
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          title: Text(
            "Login",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
            leading: BackButton(onPressed:  () {
              LoginUI.goHome(context);
            })


        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: ListView(children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Image.asset('images/strayfinder.png',
                    width: 376, height: 200, fit: BoxFit.cover)),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(40.0, 0, 40, 0),
                    width: 20.0,
                    height: 240.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            new Flexible(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                                child: Text("Email Address",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 19, fontFamily: "Poppins")),
                              ),
                            ),
                            new Flexible(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(13, 45, 0, 0),
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
                                            email = value;
                                            //Do something with the user input.
                                          },
                                          cursorColor: Color(0xff754E46),
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(Icons.email),
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
                            )],
                        ),
                        Row(
                          children: [
                            new Flexible(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(35, 15, 35, 0),
                                child: Text("Password",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 19, fontFamily: "Poppins")),
                              ),
                            ),
                            new Flexible(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(7, 20, 7, 0),
                                  child: SizedBox(
                                    height: 70.0,
                                    child: Theme(
                                      data:Theme.of(context).copyWith(
                                        colorScheme: ThemeData().colorScheme.copyWith(
                                          primary:Colors.brown,
                                        ),
                                      ),
                                      child: TextField(
                                      controller: myController1,
                                          onChanged: (value) {
                                            password = value;
                                            //Do something with the user input.
                                          },
                                          obscureText: _isHidden,
                                          cursorColor: Color(0xff754E46),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff754E46)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff754E46)),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: '',
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff754E46),
                                                    width: 2.0)),
                                            suffixIcon: GestureDetector(
                                              onTap: _togglePasswordView,
                                              child: Icon(
                                                _isHidden
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
                        )
                      ],
                    ))),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(43, 30, 10, 10),
                  child: TextButton(
                    onPressed:
                        () {
                      LoginUI.goRegister(context);
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff754E46)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(40, 10, 40, 10)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)))),
                    child: Text('Register',
                        style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 30, 10, 10),
                  child: TextButton(
                    onPressed:
                    (submit == true) ? () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if (user != null) {
                          Navigator.pushNamed(context, '/volunteertabs', arguments:
                          {'email': email});
                        }
                      } catch (e) {
                        showAlertDialog(context);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } : null,
                    style: ButtonStyle(
                        foregroundColor:

                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        (submit == true) ?
                            MaterialStateProperty.all<Color>(Color(0xff754E46))
                        : MaterialStateProperty.all<Color>(Colors.grey),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(55, 10, 55, 10)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)))),
                    child: Text('Login',
                        style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(120, 30, 0, 0),
              child: Row(children: [
                new Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                    child: Text("Forget Password? Click",
                        style: TextStyle(fontSize: 12, fontFamily: "Poppins")),
                  ),
                ),
                new Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
                    child: GestureDetector(
                      child: Text("here",
                          style: TextStyle(fontSize: 12, fontFamily: "Poppins", decoration:
                          TextDecoration.underline)),
                      onTap: () {LoginUI.resetPassword(context);},
                    ),
                  ),
                ),
              ]),
            )
          ]),
        ));
  }



///A method to toggle between masking and unmasking the password
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

///A method to show alert dialog when there is an error\
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/login');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Invalid Email Address or Password"),
    content: Text("Please check your email address or your password and try again!"),
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
