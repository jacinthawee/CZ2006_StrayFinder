import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './vet_screen.dart';
import './noticeboard_screen.dart';

class TabsUser extends StatefulWidget {
  @override
  _TabsUserState createState() => _TabsUserState();
}

class _TabsUserState extends State<TabsUser> {
  final List<Map<String, Object>> _pages = [
    {
      'page': NoticeboardWidget(),
      'title': 'Report',
    },
    {
      'page': VetWidget(),
      'title': 'Adopt',
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
            icon: Icon(Icons.description),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cat),
            label: 'Adopt',
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
