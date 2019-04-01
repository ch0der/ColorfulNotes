import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../resources/list_model.dart';
import '../resources/list_db.dart';

class TaskBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<ListModel>>();
  final _sunday = StreamController<String>.broadcast();

  Observable<String> get penis => _sunday.stream;


  Stream<String> get sunday => _sunday.stream;
  Stream<String> get description => _description.stream;
  get tasks => _taskController.stream;

  Function(String)get addTask => _description.sink.add;
  Function(String) get sunday1 => _sunday.sink.add;

  dispose(){
    _taskController.close();
    _description.close();
    _allTasks.close();
    _sunday.close();
  }
  TaskBloc(){
    fetchTask();
  }

  submitTask(){
    final validTask = _description.value;

    print('item is $validTask');
  }
  add(bool day1, bool day2, bool day3, bool day4, bool day5, bool day6, bool day7,int duration1)async{

    final sunday = day1;
    final monday = day2;
    final tuesday = day3;
    final wednesday = day4;
    final thursday =day5;
    final friday = day6;
    final saturday = day7;


    final description = _description.value;
    final duration = duration1;


    ListModel item = ListModel(description: description, duration: duration, completed: false, sunday: sunday,
        monday: monday, tuesday: tuesday, wednesday: wednesday, thursday: thursday, friday: friday, saturday: saturday );

    DBProvider.db.newItem(item);
    fetchTask();
    print('description is $description duration is $duration sunday is $day1 monday is $day2 friday is $day6' );
  }
  fetchTask()async{
    final ids = await DBProvider.db.getAllTasks();
    _taskController.sink.add(ids);
  }
  delete(int id){
    DBProvider.db.deleteTask(id);
    fetchTask();
  }
  addSunday(String day)async{
    _sunday.sink.add(day);
  }
}