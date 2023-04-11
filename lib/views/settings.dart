import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/views/auth/login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Login(title: 'Sign in')),
              );
            },
            child: Text('Log out'),
          ),
        ));
  }
}
