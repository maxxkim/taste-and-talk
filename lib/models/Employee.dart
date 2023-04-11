class Employee {
  String? key;
  EmployeeData? employeeData;

  Employee({this.key, this.employeeData});
}

class EmployeeData {
  String? name;
  String? position;
  String? email;

  EmployeeData({this.name, this.position, this.email});
  EmployeeData.fromJson(Map<dynamic, dynamic> json) {
    name = json["name"];
    position = json["position"];
    email = json["email"];
  }
}
