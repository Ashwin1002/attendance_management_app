import 'package:attendance_app/widgets/add_attendance.dart';
import '../home.dart';
import '../models/attendantModel.dart';
import '../services/attendant_service.dart';
import 'package:flutter/material.dart';

class AttendanceList extends StatefulWidget {
  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  late AttendantService _attendantService;

  List<Attendant> _attendantList = <Attendant>[];

  bool isLoading = false;

  @override
  initState() {
    super.initState();
    getAllList();
  }

  getAllList() async {
    setState(() => isLoading = true);

    _attendantService = AttendantService();
    _attendantList = <Attendant>[];

    var attendants = await _attendantService.readTodos();

    attendants.forEach((attendant) {
      setState(() {
        var model = Attendant();
        model.id = attendant['id'];
        model.date = attendant['date'];
        model.time = attendant['time'];
        model.checkedStat = attendant['checkedStat'];
        _attendantList.add(model);
      });
    });

    setState(() => isLoading = false);
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Attendance List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()))
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 130,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AttendantScreen()));
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.lightBlue.shade800.withOpacity(0.9),
                      width: 1.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Expanded(child: Text('Date')),
                  Expanded(child: Text('Time')),
                  Expanded(child: Text('Check In/Out'))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: _attendantList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.shade800.withOpacity(0.4),
                            width: 1)),
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : _attendantList.isEmpty
                            ? const Text(
                                'No Check-Ins/Outs',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )
                            : ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _attendantList[index].date ?? 'No Date',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        _attendantList[index].time ??
                                            'No Time Set',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      _attendantList[index].checkedStat ??
                                          'No Check-Ins/Outs',
                                      style: const TextStyle(fontSize: 14),
                                    ))
                                  ],
                                ),
                              ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Total Days: ${_attendantList.length}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AttendantScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildAttendance() => ListView.builder(
      itemCount: _attendantList.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.grey.withOpacity(0.4), width: 1)),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_attendantList[index].date ?? 'No Date'),
                Text(_attendantList[index].time ?? 'No Time Set'),
                Text(_attendantList[index].checkedStat ?? 'No Check-Ins/Outs')
              ],
            ),
          ),
        );
      });
}
