

/// A page that allows users to edit their profile
class CustomiseProfilePage extends StatefulWidget {
}

///State of the page
class _CustomiseProfilePageState extends State<CustomiseProfilePage> {
  ///An attribute that indicates the user's newly edited address
  String? newAddr;
  ///An attribute that indicates the user's newly edited name
  String? newName;
  ///An attribute that indicates the user's newly edited contact
  String? newContact;
  ///An attribute that indicates whether the user is currently editing the page or not
  bool isEdited = false;

  ///A method to disable the edit button
  void _disableButton() {
    
  }

  ///A method to build the page
  Widget build(BuildContext context) {
    
  }
}

///A method to show alert dialog if there is an error
showAlertDialog(BuildContext context, String text, String title) {

}
