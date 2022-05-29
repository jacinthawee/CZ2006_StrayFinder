
///Firebase authentication
final FirebaseAuth _auth = FirebaseAuth.instance;

///A page that allows the user to enter their email address and an email containing instructions on how to reset their password will be sent to their email
class ForgetPasswordPage extends StatefulWidget {

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
 
  ///A method to build the page
  Widget build(BuildContext context) {
  }
}

///A method to reset password via Firebase Authentication
Future<void> resetPassword(String email) async {
}

///A method to show alert dialog box if email is successfully sent

showAlertDialog(BuildContext context) {
}

///A method to show alert dialog box when there is an error
showAlertDialogWrong(BuildContext context) {

 
}