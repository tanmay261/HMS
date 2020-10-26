class Patients {
  int id;
  String name;
  String disease;

  patientMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['disease'] = disease;

    return map;
  }
}
