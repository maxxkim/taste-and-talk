import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  final String avatarUrl;
  final String firstName;
  final String lastName;
  final String position;
  final String email;
  final String dateOfBirth;

  const PersonalPage({
    Key? key,
    required this.avatarUrl,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.email,
    required this.dateOfBirth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      appBar: AppBar(
        title: Text('$firstName $lastName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 80,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('$firstName $lastName', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              'Position:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(position, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              'Email:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(email, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              'Date of birth:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(dateOfBirth, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
