

///A page that allows the user to leave their contact details and name if they want to bring the injured cat they found to the vet
class LeaveContactDetailsPage extends StatefulWidget {
}
/// State of the page
class _LeaveContactDetailsPageState extends State<LeaveContactDetailsPage> {


///A controller to control the name textfield
  final myController = TextEditingController();

///A controller to control the contact number textfield
  final myController2 = TextEditingController();


///An attribute that indicates if the confirm button is enabled or disabled
  bool submit = false;

  ///An attribute that indicates the passerby's name
  late String newName;
  ///An attribute that indicates the passerby's contact number
  late String contactPasserby;
 
  ///A method to build the page
  Widget build(BuildContext context) {
  }
}

