import 'package:flutter/material.dart';
import 'package:stray_finder/screens/cat_map_screen.dart';
import './vet_screen.dart';
import './noticeboard_screen.dart';
import '../managers/UserVolunteerMngr.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'vet_screen.dart';
import 'noticeboard_screen.dart';

class TabsVolunteer extends StatefulWidget {
  @override
  _TabsVolunteerState createState() => _TabsVolunteerState();
}

class _TabsVolunteerState extends State<TabsVolunteer> {
  final _auth = FirebaseAuth.instance;
  final List<String> _pages = ['Injured Cats', 'Cat Map', 'Vets'];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

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
        children: [NoticeboardWidget(), CatMapScreen(), VetScreen()],
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
  void goLogin(BuildContext context) {
      _auth.signOut();
      Navigator.pop(context);
  }
}
