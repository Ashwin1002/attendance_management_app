class Attendant {
  int? id;
  String? date;
  String? time;
  String? checkedStat;

  attendantMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['date'] = date;
    mapping['time'] = time;
    mapping['checkedStat'] = checkedStat;

    return mapping;
  }
}
