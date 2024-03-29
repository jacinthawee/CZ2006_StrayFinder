
import 'package:flutter/material.dart';
import '../widgets/IconToggleButtonWidget.dart';
import '../ui/ReportUI.dart';
import '../managers/StrayCatMngr.dart';


///A page that shows all pictures of cats with the same breed as the cat reported and prompts the user to select 0 or 1 image of the cat to match the newly found cat with those shown
class IsThisTheCatPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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

  @override

  ///A method to build the page
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final image = routeArgs['image'];
    final breed = routeArgs['breed'];
    return FutureBuilder(
      future: StrayCatMngr.getAllCatsByBreed(breed),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty)
              {
                finalSelected = false;
              }
            print(snapshot.data.toString());
            var listwidget =
            snapshot.data!
                .map((cat) =>
                IconToggleButtonWidget(cat))
                .toList();
            length = listwidget.length;
            return Scaffold(
              appBar: AppBar(
                // ],
                title: Text(
                  "Report",
                  style: TextStyle(color: Theme
                      .of(context)
                      .colorScheme
                      .secondary),
                ),

              ),
              body:
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                      child: Text("Is this the cat?",
                          style: TextStyle(
                              fontFamily: "Poppins", fontSize: 25)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                          "Please select a picture if you think the cat you found is in these pictures. Don't select any otherwise. ",
                          style: TextStyle(fontFamily: "Poppins", fontSize: 14),
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        "Only select 0 or 1 picture.", style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),
                    ),

                    (length>0) ? Container(
                        height: 450,
                        child: GridView.count(

                          crossAxisCount: 2,
                          children:
                          listwidget,


                        )):

                    Container(
                        height: 450,
                        child:
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Text("No cat of the same breed can be found. Please click confirm to continue."
                            , style: TextStyle(fontFamily: "Poppins", fontSize: 25), textAlign: TextAlign.center,),
                          )


                        ))

                    ,

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 50),
                      child:
                      TextButton(
                        onPressed: () async {
                          setState(() {

                            if (length == 0)
                            {finalSelected = false;}

                            else{
                            for (var i = 0; i < length; i++) {

                              if (listwidget[i].isSelected == true) {
                                finalSelected = true;
                                count++;
                              }

                            }
                            }
                          });

                          if (finalSelected == true &&
                              count == 1) // cat exists in db
                              {
                            for (var i = 0; i < length; i++) {
                              if (listwidget[i].isSelected == true) {
                                id = listwidget[i].cat['cat_id'];
                                catName = listwidget[i].cat['cat_name'];
                              }
                            }
                            bool is_existing = true;
                            await StrayCatMngr().updatePhoto(id, image);

                            ReportUI.goAskIfInjured(
                                context, id, catName, breed, image,
                                is_existing);
                            setState(() {
                              finalSelected = false;
                              count = 0;
                            });
                          }

                          else if (finalSelected == false) // new cat
                            // Images.addImage(10, image);
                              {
                                print("after");
                            int newCatId = await StrayCatMngr.setNewID();

                            print(newCatId);
                            ReportUI.goNameCatFound(
                                context, newCatId, breed, image);
                          }
                          else if (finalSelected == true && count > 1) {
                            finalSelected = false;
                            count = 0;
                            showAlertDialog(context);
                          }
                        },
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff754E46)),
                            padding: MaterialStateProperty.all<
                                EdgeInsetsGeometry>(
                                EdgeInsets.fromLTRB(55, 10, 55, 10)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        50.0)))),
                        child: Text('Confirm',
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Poppins")),
                      ),
                    ),
                  ],
                ),
              ),

            );
          } else {
            // add
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }



}

///A method to show alert dialog when there is an error
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/register');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error: Multiple images detected"),
    content: Text("Please only select 0 or 1 picture!"),
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