import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

///A page that allows the user to enter their email address and an email containing instructions on how to reset their password will be sent to their email
class ForgetPasswordPage extends StatefulWidget {

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

///The state of the page
class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  ///An attribute indicating the email they entered
  late String email;

  ///An attribute indicating if the spinner is showing or not
  bool showSpinner = false;

  ///A controller to control the text field
  final myController = TextEditingController();

  ///An attribute that indicates if the confirm button is enabled or disabled
  bool submit = false;
  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      setState(() {
        if (myController.text.isNotEmpty) {
          submit = true;
        }
        else {
          submit = false;
        }
      });
    });
  }
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }
  // @override


  @override

  ///A method to build the page
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

            title: Text(
              "Reset Password",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),


        ),
        body:
        ListView(children: [
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
                      children: [Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: Text("Enter your email address:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 19, fontFamily: "Poppins")),
                              ),
                            new Flexible(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
                                  child: SizedBox(
                                    height: 70.0,
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
                                  )),
                            )],
                        ))),


                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
                  child: TextButton(
                    onPressed:
                    (submit == true) ? () async {try{

                      await resetPassword(email);
                      showAlertDialog(context);
                    } catch (e) {
    showAlertDialogWrong(context);
    }}: null,
                    style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        (submit == true) ?
                        MaterialStateProperty.all<Color>(Color(0xff754E46))
                            : MaterialStateProperty.all<Color>(Colors.grey),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(40, 10, 40, 10)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)))),
                    child: Text('Reset Password',
                        style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                  ),
                ),
          ]),
        );
  }
}

///A method to reset password via Firebase Authentication
Future<void> resetPassword(String email) async {
  await _auth.sendPasswordResetEmail(email: email);
}

///A method to show alert dialog box if email is successfully sent

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pushNamed(context, '/login');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Reset Password"),
    content: Text("An instruction on how to reset password is sent to your email address."),
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

///A method to show alert dialog box when there is an error
showAlertDialogWrong(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/forgetpassword');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Invalid Email Address"),
    content: Text("Please check your email address and try again!"),
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