import 'package:flutter/material.dart';
import 'layouts/palette.dart';
import '/views/personal.dart';
import '/views/calendar.dart';
import '/views/settings.dart';
import '/views/admin/admin.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    PersonalPage(),
    EventsPage(),
    CalendarPage(),
    AdminPage(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taste & Talk'),
      ),
      body: Center(child: _pages.elementAt(_selectedIndex)),
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
      ], currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}