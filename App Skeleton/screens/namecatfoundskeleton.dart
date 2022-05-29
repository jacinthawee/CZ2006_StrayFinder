

///A page that prompts the user to name the cat found
class NameCatFoundPage extends StatefulWidget {
}

///State of the page
class _NameCatFoundPageState extends State<NameCatFoundPage> {
  ///Controller that controls the textfield of the name
  final myController = TextEditingController();
  ///Attribute that indicates the name of the cat
  late String newName = '';
  ///Attribute that indicates if the confirm button is enabled or disabled
  bool submit = false;
 

  ///A method to build the page
  Widget build(BuildContext context) {
  }
}