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
    setState(() {
      _selectedPageIndex = index;
    });
  }

  /// build the page
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final email = routeArgs['email'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _pages[_selectedPageIndex],
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Map<String, dynamic> info = await UserVolunteerMngr.getVolunteerInfo(email);
                Navigator.pushNamed(
                  context,
                  '/customiseprofile',
                  arguments: info,
                );
              },
              icon: Icon(Icons.person),
            ),

            IconButton(
              onPressed: () {
                goLogin(context);
              },
              icon: Icon(Icons.logout),
            ),
        ],
      ),
      // body: _pages[_selectedPageIndex]['page'] as Widget,
      body: IndexedStack(
        children: [NoticeboardScreen(), CatMapScreen(), VetScreen()],
        index: _selectedPageIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Noticeboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Vets',
          ),
        ],
      ),
    );
  }
  /// a method for user to go login page after they log out
  void goLogin(BuildContext context) {
      _auth.signOut();
      Navigator.pop(context);
  }
}
