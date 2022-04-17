import 'package:flutter/material.dart';
import '../ui/ReportUI.dart';


class NameCatFoundPage extends StatefulWidget {
  const NameCatFoundPage({Key? key}) : super(key: key);

  @override
  State<NameCatFoundPage> createState() => _NameCatFoundPageState();
}

class _NameCatFoundPageState extends State<NameCatFoundPage> {
  final myController = TextEditingController();
  late String newName = '';
  bool submit = false;
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
    });}
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final id = routeArgs['id'];
    final breed = routeArgs['breed'];
    final image = routeArgs['imgURL'];

    return Scaffold(
      appBar: AppBar(
        //     leading: BackButton(onPressed:  () {
        //   Navigator.pushNamed(
        //     context,
        //     '/isthisthecat',
        //   );
        // }) ,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       ReportUI.goUserTabs(context);
        //     },
        //     icon: Icon(Icons.home),
        //   ),
        // ],

        title: Text(
          "Report",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50,160,50,0),
                child: Text('Please give a name to the cat you found!', style: TextStyle(fontSize: 25, fontFamily: "Poppins"), textAlign: TextAlign.center, ),
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 90, 40, 0),
                        child: SizedBox(
                            height: 70.0,
                            child: TextField(
                              controller: myController,
                              onChanged: (value)
                              {newName = value;},
                              cursorColor: Color(0xff754E46),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff754E46)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Do not use rude words!',
                                labelText: '',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff754E46), width: 2.0)),
                              ),
                              style: TextStyle(color: Colors.black,
                                  fontFamily: "Poppins"),
                            )),
                      )),
                ],
              ),
              Container(width: 100, height: 20),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: (submit == true ) ? TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff754E46)),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.fromLTRB(70, 10, 70, 10)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)))),
                        child: Text('Confirm',
                            style: TextStyle(fontSize: 20, fontFamily: "Poppins")),

                        onPressed:  () {
                          bool isExisting = false;
                          ReportUI.goAskIfInjured(context, id, newName, breed, image, isExisting);
                        }) :
                    TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.fromLTRB(70, 10, 70, 10)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)))),
                        child: Text('Confirm',
                            style: TextStyle(fontSize: 20, fontFamily: "Poppins")),

                        onPressed:  null),
                  )
              )
            ],
          ),
        ),
      ),
    );;
  }
}