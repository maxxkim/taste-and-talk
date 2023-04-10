import 'package:flutter/material.dart';
import 'layouts/palette.dart';
import '/views/personal.dart';
import '/views/calendar.dart';
import '/views/settings.dart';
import '/views/events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/views/admin/admin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  var selectedIndex = 0; // ← Add this property.

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = PersonalPage(
          avatarUrl:
              'https://pic.rutube.ru/video/e7/37/e737b9113b1b952180c9c5a12f26c8e6.jpg',
          firstName: 'Max',
          lastName: 'Kim',
          position: 'Software Engineer/Wine Sommelier',
          email: 'maxxkim@ya.ru',
          dateOfBirth: 'March 6, 1999',
        );
        break;
      case 1:
        page = EventsPage();
        break;
      case 2:
        page = CalendarPage();
        break;
      case 3:
        page = AdminPage();
        break;
      case 4:
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Color(0xFFf2f2f2),
        body: Center(
          child: page,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
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
          ],
          currentIndex: selectedIndex, //New
          onTap: onItemTapped,
        ),
      );
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
