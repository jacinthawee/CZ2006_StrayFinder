import 'UploadPicturePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stray_finder/screens/UploadPicturePage.dart';
import 'VetScreen.dart';
import 'AdoptPage.dart';

/// A class to build buttom tabs including Report tab, Adopt tab and Vet tab for a passerby user
class TabsPasserby extends StatefulWidget {
  @override
  _TabsPasserbyState createState() => _TabsPasserbyState();
}

/// state of the page
class _TabsPasserbyState extends State<TabsPasserby> {
  /// list of tabs name
  final List<String> _pages = ['Report', 'Adopt', 'Vets'];
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
