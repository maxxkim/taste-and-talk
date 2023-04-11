import 'package:flutter/material.dart';
import '/views/admin/event/index.dart';
import '/models/Event.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<Event> EventList = [];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          backgroundColor: const Color(0xFFf2f2f2),
          appBar: AppBar(
            title: const Text('Events schedule'),
          ),
          body: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация итальянских вин @ 2k1 Bratskaya st. (4.11.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация рислингов @ 15 Samokatnaya st. (6.11.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация крафтового пива @ 23 Shabolovka st. (10.11.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация виски @ 2k1 Novocheremushkinskaya st. (16.11.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация рислингов @ 15 Samokatnaya st. (18.11.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация батиных настоек @ 23 Shabolovka st. (19.11.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация итальянских вин @ 2k1 Bratskaya st. (5.12.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация рислингов @ 15 Samokatnaya st. (8.12.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация крафтового пива @ 23 Shabolovka st. (9.12.2023)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация виски @ 2k1 Novocheremushkinskaya st. (2.1.2024)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация рислингов @ 15 Samokatnaya st. (3.1.2024)'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar_outlined),
                title: Text(
                    'Дегустация батиных настоек @ 23 Shabolovka st. (10.1.2024)'),
                trailing: Icon(Icons.more_vert),
              )
            ],
          ));
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
