import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../resources/list_model.dart';
import '../resources/list_db.dart';

class TaskBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<int>>();

  Stream<String> get description => _description.stream;
  get tasks => _taskController.stream;

  Function(String)get addTask => _description.sink.add;

  dispose(){
    _taskController.close();
    _description.close();
  }
  TaskBloc(){
    getItems();
  }

  getItems() async{
    _taskController.sink.add(await DBProvider.db.getAllTasks());
  }
  submitTask(){
    final validTask = _description.value;

    print('item is $validTask');
  }
  add(){
    final description = _description.value;
    final duration = 1;

    ListModel item = ListModel(description: description, duration: duration, completed: false, sunday: false,
        monday: false, tuesday: false, wednesday: false, thursday: false, friday: false, saturday: false );

    DBProvider.db.newItem(item);
    print('description is $description duration is $duration');
    getItems();
  }


}