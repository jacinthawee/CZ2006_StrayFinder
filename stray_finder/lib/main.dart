import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/CustomiseProfilePage.dart';
import 'screens/ForgetPasswordPage.dart';
import 'screens/IsThisTheCatPage.dart';
import 'screens/LoginPage.dart';
import 'screens/LeaveContactDetailsPage.dart';
import 'screens/RegistrationPage.dart';
import 'screens/BringCatToVetPage.dart';
import 'screens/AskIfInjuredPage.dart';
import 'screens/VetScreen.dart';
import 'screens/TabsPasserby.dart';
import 'screens/TabsVolunteer.dart';
import 'screens/NoticeboardScreen.dart';
import 'screens/CatDetailScreen.dart';
import 'screens/ThankYouForReportingPage.dart';
import 'screens/NameCatFoundPage.dart';
import 'screens/DescribeInjuryPage.dart';
import 'screens/UploadPicturePage.dart';

/// The main function to initialise and run the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// State of the app 
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
          subtitle1: const TextStyle(
            fontSize: 15,
          ),
        )
      ),
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/report': (context) => LeaveContactDetailsPage(),
        '/bringtovet': (context) => BringCatToVetPage(),
        '/askifinjured': (context) => AskIfInjuredPage(),
        '/vet': (context) => VetScreen(),
        '/volunteertabs': (context) => TabsVolunteer(),
        '/usertabs': (context) => TabsPasserby(),
        '/noticeboard': (context) => NoticeboardScreen(),
        '/thankyouforreporting': (context) => ThankYouForReportingPage(),
        '/namecatfound': (context) => NameCatFoundPage(),
        '/isthisthecat': (context) => IsThisTheCatPage(),
        '/describeinjury': (context) => DescribeInjuryPage(),
        '/uploadpicture': (context) => UploadPicturePage(),
        '/customiseprofile': (context) => CustomiseProfilePage(),
        '/forgetpassword': (context) => ForgetPasswordPage(),
        '/cat_detail_screen' : (context) => CatDetailScreen(),
      },
    );
  }
}

/// A page which shows the buttons for 'I am a passerby' and 'I am a volunteer'
class HomePage extends StatelessWidget {
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

  /// The method to redirect to user tabs
  void report(BuildContext context) {
    Navigator.pushNamed(
    context,
    '/usertabs',
    );
  }
}
