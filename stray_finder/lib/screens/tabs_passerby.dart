import '../screens/uploadpicture.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stray_finder/screens/uploadpicture.dart';
import 'vet_screen.dart';
import 'adoptpage.dart';

class TabsPasserby extends StatefulWidget {
  @override
  _TabsPasserbyState createState() => _TabsPasserbyState();
}

class _TabsPasserbyState extends State<TabsPasserby> {
  final List<String> _pages = ['Report', 'Adopt', 'Vets'];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex],
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        leading: BackButton(onPressed:  () {
          Navigator.pushNamed(
            context,
            '/',
          );
        }),),
      body: IndexedStack(
        children: [UploadPicturePage(), AdoptPage(), VetScreen()],
        index: _selectedPageIndex,
      ),
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
        ]));

  }
}
