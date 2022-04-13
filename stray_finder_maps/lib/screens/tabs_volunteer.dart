import 'package:flutter/material.dart';
import './vet_screen.dart';
import './noticeboard_screen.dart';

class TabsVolunteer extends StatefulWidget {
  @override
  _TabsVolunteerState createState() => _TabsVolunteerState();
}

class _TabsVolunteerState extends State<TabsVolunteer> {
  final List<Map<String, Object>> _pages = [
    {
      'page': NoticeboardWidget(),
      'title': 'Injured Cats',
    },
    {
      'page': VetWidget(),
      'title': 'Map',
    },
    {
      'page': VetWidget(),
      'title': 'Vets',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
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
}
