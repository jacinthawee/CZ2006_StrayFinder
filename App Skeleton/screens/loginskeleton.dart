

///An attribute that uses Firebase authentication
final FirebaseAuth _auth = FirebaseAuth.instance;

///A page that allows the user to login
class LoginPage extends StatefulWidget {
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

  ///A method to build the page
  Widget build(BuildContext context) {
  }



///A method to toggle between masking and unmasking the password
  void _togglePasswordView() {
    
  }
}

///A method to show alert dialog when there is an error\
showAlertDialog(BuildContext context) {

}
