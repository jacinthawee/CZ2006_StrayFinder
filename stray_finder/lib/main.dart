// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:stray_finder/screens/tabs_user.dart';
// import 'firebase_options.dart';
// import 'screens/tabs_volunteer.dart';
// import './screens/vet_screen.dart';
// import './screens/cat_map.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'StrayFinder',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         primaryColor: Colors.yellow,
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: Colors.yellow,
//           accentColor: const Color(0xFF754E46),
//           backgroundColor: Colors.white,
//         ),
//         fontFamily: 'Poppins',
//         textTheme: Theme.of(context).textTheme.copyWith(
//           headline4: const TextStyle(
//             fontSize: 30,
//             color : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//           headline5: const TextStyle(
//             fontSize:13, 
//             fontWeight: FontWeight.bold
//           ),
//           headline6: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//           bodyText1: const TextStyle(
//             fontSize:12, 
//             fontWeight: FontWeight.bold
//           ),
//           bodyText2: const TextStyle(
//             fontSize:12, 
//           ),
//           subtitle1: const TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.bold,
//           ),
//           subtitle2: const TextStyle(
//             fontSize: 15,
//             // color: Colors.black,
//           ),
//           button: const TextStyle(
//             color: Color(0xFF754E46),
//             fontSize:12, 
//             fontWeight: FontWeight.bold
//           ),
//         )
//       ),
//       // home: CategoriesScreen(),
//       initialRoute: '/', // default is '/'
//       routes: {
//         '/' : (BuildContext ctx) => TabsVolunteer(),
//         // '/' : (BuildContext ctx) => TabsUser(),
//         // MealScreen.routeName : (BuildContext ctx) => MealScreen(availableMeals),
//         CatDetailScreen.routeName : (BuildContext ctx) => CatDetailScreen(),
//         // FilterScreen.routeName : (BuildContext ctx) => FilterScreen(filters, toggleSwitch, setFilters),
//       },
//     );
//   }
// }

// // import 'package:image_picker/image_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:async';
// // import 'dart:io';
// // import 'dart:convert';
// // import 'package:path/path.dart' as Path;
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // // import 'package:xfile/xfile.dart';
// // // import 'package:provider/provider.dart';
// // import 'firebase_options.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// // // import 'package:path/path.dart';
// // // import 'package:json_annotation/json_annotation.dart';
// // // import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
// // // import 'package:testing/addcat.dart';

// // void main() async{
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// //   );
// //   runApp(MyApp());
// // }
// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   ImagePicker picker = ImagePicker();
// //   final storageRef = FirebaseStorage.instance.ref();
// //   // DocumentReference sightingRef = FirebaseStorage.instance.collection("sightings").doc();
// //   Future<String> uploadFile(File _image) async {
// //     var imgRef = storageRef.child('profiles/${Path.basename(_image.path)}');
// //     await imgRef.putFile(_image);
// //     print('File Uploaded');
// //     String returnURL = await imgRef.getDownloadURL().then((value) { return value; });
// //     return returnURL;
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return  MaterialApp(
// //       title: 'Testing Firebase',
// //       theme: ThemeData(
// //         buttonTheme: Theme.of(context).buttonTheme.copyWith(
// //           highlightColor: Colors.deepPurple,
// //         ),
// //         primarySwatch: Colors.deepPurple,
// //         // textTheme: GoogleFonts.robotoTextTheme(
// //         //   Theme.of(context).textTheme,
// //         // ),
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: TextButton(
// //         onPressed: ()async{
// //           var pickerFile = await picker.pickImage(source: ImageSource.gallery,);
// //           File _image = File(pickerFile!.path);
// //           String url = await uploadFile(_image);
// //           AddCat('A', 'B', 1, true, GeoPoint(15,20), url).addCat();

// //           var q = await QueryCat().getCatDetails();
// //           q.forEach((element) { print(element.toString()); });
// //           // print(GeoPoint(15,20).latitude);
// //           // AddCat('A', 'B', 1, true, GeoPoint(15,20)).addCat();
// //         },
// //         child: const Text(
// //           "Query",
// //           style: TextStyle(fontSize: 20),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class AddCat {
// //   AddCat(
// //       this.name,
// //       this.breed,
// //       this.id,
// //       this.statusInjury,
// //       this.lastSeen,
// //       this.profileImgURL
// //       //this.contactNo,
// //       //this.photo,
// //       );

// //   final String name;
// //   final String breed;
// //   final int id;
// //   final bool statusInjury;
// //   final GeoPoint lastSeen;
// //   final String profileImgURL;
// //   //final String contactNo;
// //   //final File photo;

// //   CollectionReference cats = FirebaseFirestore.instance.collection('cats');

// //   Future<void> addCat() {
// //     return cats
// //         .doc(id.toString())
// //         .set({
// //       'cat_name': name, // Benson
// //       'cat_breed': breed, // Persian
// //       'cat_id': id, // 42
// //       'is_injured': statusInjury,
// //       'last_seen': lastSeen,
// //       'cat_img': profileImgURL,
// //     })
// //         .then((value) => print("Cat Added"))
// //         .catchError((error) => print("Failed to add cat: $error"));
// //   }
// // }

// // class QueryCat {
// //   CollectionReference cats = FirebaseFirestore.instance.collection('cats');

// //   Future<List<Map<String, dynamic>>> getCatDetails() async{

// //     List<Map<String, dynamic>> queries = [];
// //     final qs = await FirebaseFirestore.instance
// //         .collection('cats')
// //         .get()
// //         .then((value) => value.docs.forEach( (element) { queries.add(element.data()); } ));
// //     return queries;
// //   }
// // }

import './screens/customiseprofile.dart';
import './screens/forgetpassword.dart';
import './screens/isthisthecat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/leavecontactdetailspage.dart';
import './screens/register.dart';
import './screens/bringcattovet.dart';
import './screens/askifinjured.dart';
import './screens/vet_screen.dart';
import './screens/tabs_user.dart';
import './screens/tabs_volunteer.dart';
import './screens/noticeboard_screen.dart';
import './screens/cat_map.dart';
import './screens/thankyouforreporting.dart';
import './screens/namecatfound.dart';
// import 'isthisthecat.dart';
import './screens/describeinjury.dart';
import './screens/uploadpicture.dart';
import './widgets/adopt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StrayFinder',
      theme:
      ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.yellow,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
          accentColor: const Color(0xFF754E46),
          backgroundColor: Colors.white,
        ),
        fontFamily: 'Poppins',
        textTheme: Theme.of(context).textTheme.copyWith(
          headline4: const TextStyle(
            fontSize: 30,
            color : Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline5: const TextStyle(
            fontSize:13, 
            fontWeight: FontWeight.bold
          ),
          headline6: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: const TextStyle(
            fontSize:12, 
            fontWeight: FontWeight.bold
          ),
          bodyText2: const TextStyle(
            fontSize:12, 
          ),
          // subtitle1: const TextStyle(
          //   fontSize: 15,
          //   fontWeight: FontWeight.bold,
          // ),
          subtitle1: const TextStyle(
            fontSize: 15,
          ),
          // button: const TextStyle(
          //   color: Color(0xFF754E46),
          //   fontSize:12, 
          //   // fontWeight: FontWeight.bold
          // ),
        )
      ),
      routes: {
        '/': (context) => Home(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/report': (context) => LeaveContactDetailsPage(),
        '/bringtovet': (context) => BringCatToVetPage(),
        '/askifinjured': (context) => AskIfInjuredPage(),
        '/vet': (context) => VetScreen(),
        '/volunteertabs': (context) => TabsVolunteer(),
        '/usertabs': (context) => TabsUser(),
        '/noticeboard': (context) => NoticeboardScreen(),
        '/catmap': (context) => CatDetailScreen(),
        '/thankyouforreporting': (context) => ThankYouForReportingPage(),
        '/namecatfound': (context) => NameCatFound(),
        '/isthisthecat': (context) => IsThisTheCatPage(),
        '/describeinjury': (context) => DescribeInjuryPage(),
        '/uploadpicture': (context) => UploadPicturePage(),
        '/customiseprofile': (context) => CustomiseProfile(),
        '/forgetpassword': (context) => ForgetPass(),
        CatDetailScreen.routeName : (BuildContext ctx) => CatDetailScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: Image.asset('images/strayfinder.png',
                    width: 376, height: 200, fit: BoxFit.cover)),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color> (Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.yellow),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.fromLTRB(80, 10, 80, 10)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50.0)))),
                        onPressed:  () {
    report(context);
    },
                        child: Text('I am a passerby!',
                            style:
                                TextStyle(fontSize: 20, fontFamily: "Poppins")),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: TextButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellow),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.fromLTRB(80, 10, 80, 10)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)))),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/login',
                            );
                          },
                          child: Text('I am a volunteer!',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: "Poppins")),
                        ))
                  ],
                ))
          ],
        ));
  }

  void report(BuildContext context) {
    Navigator.pushNamed(
    context,
    '/usertabs',
    );
  }
}
