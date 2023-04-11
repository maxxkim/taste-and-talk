import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/models/Event.dart';
import 'package:intl/intl.dart';

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  late DateTime _selectedDate;
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editLocationController = TextEditingController();
  final TextEditingController _editDateController = TextEditingController();

  List<Event> EventList = [];

  @override
  void initState() {
    super.initState();

    retrieveEventData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f2f2),
      body: SingleChildScrollView(
        child: Column(children: [
          for (int i = 0; i < EventList.length; i++) EventWidget(EventList[i])
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            EventDialog();
          },
          child: const Icon(Icons.add)),
    );
  }

  void EventDialog() {
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
                      controller: _editLocationController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Location"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _editDateController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Date scheduled"),
                        readOnly: true,
                        onTap: () async {
                          //_selectDate(context);
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "name": _editNameController.text.toString(),
                          "location": _editLocationController.text.toString(),
                          "date": _editDateController.text.toString(),
                        };
                        dbRef.child("Event").push().set(data).then((value) {
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

  _selectDate(BuildContext context) async {
    Future<DateTime?> newSelectedDate = showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (newSelectedDate != null) {
      _selectedDate = DateTime.parse(newSelectedDate.toString());
      _editDateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _editDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  void retrieveEventData() {
    dbRef.child('Event').onChildAdded.listen((data) {
      EventData eventData = EventData.fromJson(data.snapshot.value as Map);
      Event event = Event(key: data.snapshot.key, eventData: eventData);
      EventList.add(event);
      setState(() {});
    });
  }

  Widget EventWidget(Event EventList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(children: [
          Text(EventList.eventData!.name!),
          Text(EventList.eventData!.location!),
          Text(EventList.eventData!.date!.toString()),
        ])
      ]),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
