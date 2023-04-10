import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/models/Employee.dart';
import '/controllers/EmployeeController.dart';
import '/views/admin/employee/index.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editPositionController = TextEditingController();
  final TextEditingController _editEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            employeeDialog();
          },
          child: const Icon(Icons.add)),
    );
  }

  void employeeDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Color(0xFFf2f2f2),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _editNameController,
                    decoration: const InputDecoration(helperText: "Name"),
                  ),
                  TextField(
                      controller: _editPositionController,
                      decoration:
                          const InputDecoration(helperText: "Position")),
                  TextField(
                      controller: _editEmailController,
                      decoration: const InputDecoration(helperText: "Email")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "name": _editNameController.text.toString(),
                          "position": _editPositionController.text.toString(),
                          "email": _editEmailController.text.toString(),
                        };
                        dbRef.child("Employee").push().set(data).then((value) {
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text("Save")),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                            width: 300,
                            height: 300,
                            child: SvgPicture.asset("logo.svg")),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
