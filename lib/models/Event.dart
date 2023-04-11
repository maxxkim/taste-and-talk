class Event {
  String? key;
  EventData? eventData;

  Event({this.key, this.eventData});
}

class EventData {
  String? name;
  String? location;
  DateTime? date;

  EventData({this.name, this.location, this.date});
  EventData.fromJson(Map<dynamic, dynamic> json) {
    name = json["name"];
    location = json["location"];
    date = json["date"];
  }
}
