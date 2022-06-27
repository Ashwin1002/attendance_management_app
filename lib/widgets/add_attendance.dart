import 'package:flutter/material.dart';
import '../models/attendantModel.dart';
import '../services/attendant_service.dart';
import 'package:intl/intl.dart';

class AttendantScreen extends StatefulWidget {
  @override
  _AttendantScreenState createState() => _AttendantScreenState();
}

class _AttendantScreenState extends State<AttendantScreen> {
  var _dateController = TextEditingController();

  var _timeController = TextEditingController();

  var _selectedValue;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  DateTime _dateTime = DateTime.now();

  _selectedCheckedDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _dateController.text = DateFormat('MMMMd').format(_pickedDate);
      });
    }
  }

  TimeOfDay _timeOfDay = TimeOfDay.now();

  _selectedCheckedTime(BuildContext context) async {
    var _pickedTime =
        await showTimePicker(context: context, initialTime: _timeOfDay);

    if (_pickedTime != null) {
      setState(() {
        _timeOfDay = _pickedTime;
        _timeController.text = _pickedTime.format(context);
      });
    }
  }

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState?.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Attendance'),
      ),
      key: _globalKey,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'Pick a Date',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: InkWell(
                    onTap: () {
                      _selectedCheckedDate(context);
                    },
                    child: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _timeController,
                decoration: InputDecoration(
                  hintText: "Checked In/Out Time",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: InkWell(
                    onTap: () {
                      _selectedCheckedTime(context);
                    },
                    child: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    hintText: "Check In/Out",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    )
                ),
                value: _selectedValue,
                items: const [
                  DropdownMenuItem(
                    value: "Check In",
                    child: Text("Check In"),
                  ),
                  DropdownMenuItem(
                    value: "Check Out",
                    child: Text("Check Out"),
                  ),
                ],
                hint: Text('CheckedIn/Out Time'),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  border: Border.all()
              ),
              child: TextButton(
                  onPressed: () async {
                    var todoObject = Attendant();

                    todoObject.date = _dateController.text;
                    todoObject.time = _timeController.text;
                    todoObject.checkedStat = _selectedValue.toString();

                    var _attendantService = AttendantService();
                    var result = await _attendantService.saveTodo(todoObject);

                    if (result > 0) {
                      _showSuccessSnackBar(Text('Created'));
                    }

                    print(result);
                  },
                  child: const Text('Submit', style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                  ),)),
            ),
          ],
        ),
      ),
    );
  }
}
