

///A page that prompts the user to give the app access to their location and also ask the user to specify if the cat found is injured or not
class AskIfInjuredPage extends StatefulWidget {
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

  

  ///A method to build the page
  Widget build(BuildContext context) {
    
  }
}

///A method to show alert dialog when there is an error 
showAlertDialog(BuildContext context, String title, String content) {

}