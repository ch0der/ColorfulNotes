import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../resources/list_model.dart';
import '../resources/list_db.dart';

class TaskBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _task = BehaviorSubject<String>();

  Stream<String> get task => _task.stream;
  get tasks => _taskController.stream;

  Function(String)get addTask => _task.sink.add;

  dispose(){
    _taskController.close();
    _task.close();
  }

  getTasks() async{
    _taskController.sink.add(await DBProvider.db.getTasks());
  }


}