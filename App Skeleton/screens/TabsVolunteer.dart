import 'package:flutter/material.dart';
import 'CatMapScreen.dart';
import 'VetScreen.dart';
import 'NoticeboardScreen.dart';
import '../managers/UserVolunteerMngr.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A class to build buttom tabs including Noticeboard tab, Cat Map tab and Vet tab for a volunteer user
class TabsVolunteer extends StatefulWidget {
  @override
  _TabsVolunteerState createState() => _TabsVolunteerState();
}

/// state of the page
class _TabsVolunteerState extends State<TabsVolunteer> {
  /// FirebaseAuth instance to help register a user
  final _auth = FirebaseAuth.instance;
  /// list of tabs name
  final List<String> _pages = ['Injured Cats', 'Cat Map', 'Vets'];
  /// index of the selected tab
  int _selectedPageIndex = 0;

  /// a method to allow user to switch between tabs
  void _selectPage(int index) {
  }

  /// build the page
  @override
  Widget build(BuildContext context) {
    
  }
  /// a method for user to go login page after they log out
  void goLogin(BuildContext context) {

  }
}
