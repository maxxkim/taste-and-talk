import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/models/Employee.dart';

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editPositionController = TextEditingController();
  final TextEditingController _editEmailController = TextEditingController();

  List<Employee> employeeList = [];

  @override
  void initState() {
    super.initState();

    retrieveEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      body: SingleChildScrollView(
        child: Column(children: [
          for (int i = 0; i < employeeList.length; i++)
            employeeWidget(employeeList[i])
        ]),
      ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _editNameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _editPositionController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Position")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _editEmailController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email")),
                  ),
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

  void retrieveEmployeeData() {
    dbRef.child('Employee').onChildAdded.listen((data) {
      EmployeeData employeeData =
          EmployeeData.fromJson(data.snapshot.value as Map);
      Employee employee =
          Employee(key: data.snapshot.key, employeeData: employeeData);
      employeeList.add(employee);
      setState(() {});
    });
  }

  Widget employeeWidget(Employee employeeList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(children: [
          Text(employeeList.employeeData!.name!),
          Text(employeeList.employeeData!.position!),
          Text(employeeList.employeeData!.email!),
        ])
      ]),
    );
  }
}
