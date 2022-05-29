
///A page that shows all pictures of cats with the same breed as the cat reported and prompts the user to select 0 or 1 image of the cat to match the newly found cat with those shown
class IsThisTheCatPage extends StatefulWidget {
}

///State of the page
class _MyAppState extends State<IsThisTheCatPage> {

///An attribute that indicates if a cat has been selected or not
  bool finalSelected = false;
///An attribute that indicates the number of the pictures shown
  int length = 0;
///An attribute that counts the number of pictures the user selects
  int count = 0;

///An attribute that indicates the id of the newly found cat
  int id = -1;

///An attribute that indicates the name of the newly found cat
  String catName = "";

///A method to build the page
  Widget build(BuildContext context) {
  }



}

///A method to show alert dialog when there is an error

showAlertDialog(BuildContext context) {

}