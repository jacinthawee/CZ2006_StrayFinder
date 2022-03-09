import 'package:flutter/material.dart';
import 'package:stray_finder/screens/tabs_user.dart';
import 'screens/tabs_volunteer.dart';
import './screens/vet_screen.dart';
import './screens/cat_map.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StrayFinder',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.yellow,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
          accentColor: const Color(0xFF754E46),
          backgroundColor: Colors.white,
        ),
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        )
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/' : (BuildContext ctx) => TabsVolunteer(),
        // '/' : (BuildContext ctx) => TabsUser(),
        // MealScreen.routeName : (BuildContext ctx) => MealScreen(availableMeals),
        CatDetailScreen.routeName : (BuildContext ctx) => CatDetailScreen(),
        // FilterScreen.routeName : (BuildContext ctx) => FilterScreen(filters, toggleSwitch, setFilters),
      },
    );
  }
}

