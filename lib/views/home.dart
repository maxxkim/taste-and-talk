import 'package:flutter/material.dart';
import '/views/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Taste & Talk'),
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Palette.kToDark,
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
          BottomNavigationBarItem(
            backgroundColor: Palette.kToDark,
            icon: Icon(Icons.wine_bar),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            backgroundColor: Palette.kToDark,
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            backgroundColor: Palette.kToDark,
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            backgroundColor: Palette.kToDark,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ], currentIndex: _selectedIndex, onTap: _onItemTapped));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
