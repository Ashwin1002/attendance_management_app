import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_attendancelist_sqflite');
    var database =
    await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    // Create table todos
    await database.execute(
        "CREATE TABLE attendance(id INTEGER PRIMARY KEY, date TEXT, time TEXT, checkedStat TEXT)");

  }
}
