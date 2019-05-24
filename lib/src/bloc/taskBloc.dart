import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../resources/list_model.dart';
import '../resources/list_db.dart';

class TaskBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _taskDayController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<ListModel>>();
  final _total = BehaviorSubject<String>();



  Stream<String> get description => _description.stream;
  Stream<String> get sum => _total.stream;

  get tasks => _taskController.stream;
  get taskDay =>_taskDayController.stream;

  Function(String)get addTask => _description.sink.add;
  Function(String)get total => _total.sink.add;


  dispose(){
    _taskController.close();
    _description.close();
    _allTasks.close();
    _taskDayController.close();
    _total.close();

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
  }
  fetchTask()async{
    final ids = await DBProvider.db.getAllTasks();
    _taskController.sink.add(ids);
  }
  delete(int id){
    DBProvider.db.deleteTask(id);
    fetchTask();
  }
  getSundayTasks()async {
    final ids = await DBProvider.db.getSunday();
    _taskDayController.sink.add(ids);
  }
  taskBlocDay(){
    getSundayTasks();
  }
  totalTime()async{
    var _totaal = await DBProvider.db.calculateTotal();
    _total.sink.add(_totaal);
    print(_total.value);
  }
}