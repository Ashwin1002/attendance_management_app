import '../models/attendantModel.dart';
import '../repositories/repository.dart';

class AttendantService {
  late Repository _repository;

  AttendantService() {
    _repository = Repository();
  }

  // create todos
  saveTodo(Attendant attendant) async {
    return await _repository.insertData('attendance', attendant.attendantMap());
  }

  // read todos
  readTodos() async {
    return await _repository.readData('attendance');
  }
}
