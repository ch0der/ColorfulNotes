import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../resources/list_model.dart';
import '../resources/list_db.dart';

class TaskBloc{


  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<ListModel>>();
  final _total = BehaviorSubject<int>();
  final _tuesday = StreamController<List<ListModel>>.broadcast();



  Stream<String> get description => _description.stream;
  Stream<int> get sum => _total.stream;

  get tasks => _taskController.stream;
  get tuesday => _tuesday.stream;

  Function(String)get addTask => _description.sink.add;
  Function(int)get total => _total.sink.add;


  dispose(){
    _taskController.close();
    _description.close();
    _allTasks.close();
    _total.close();
    _tuesday.close();

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
  totalTime()async{
    var _totaal = await DBProvider.db.calculateTotal();
    _total.sink.add(_totaal);
    print(_total.value);
  }
  complete(ListModel item){
    DBProvider.db.complete(item);
    fetchTask();
  }
  deleteDay(String today){
    DBProvider.db.deleteADay(today);
    fetchTask();

  }
  deleteALL(){
    DBProvider.db.deleteALL();
    fetchTask();
  }



}
class TuesdayBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<ListModel>>();
  final _total = BehaviorSubject<int>();
  final _tuesday = StreamController<List<ListModel>>.broadcast();



  Stream<String> get description => _description.stream;
  Stream<int> get sum => _total.stream;

  get tasks => _taskController.stream;
  get tuesday => _tuesday.stream;

  Function(String)get addTask => _description.sink.add;
  Function(int)get total => _total.sink.add;


  dispose(){
    _taskController.close();
    _description.close();
    _allTasks.close();
    _total.close();
    _tuesday.close();

  }
  TuesdayBloc(){
    fetchTask();
  }

  submitTask(){
    final validTask = _description.value;

    print('item is $validTask');
  }

  fetchTask()async{
    final ids = await DBProvider.db.tuesday();
    _taskController.sink.add(ids);
  }
  delete(int id){
    DBProvider.db.deleteTask(id);
    fetchTask();
  }
  totalTime()async{
    int _totaal = await DBProvider.db.calculateTotal2('tuesday');
    _total.sink.add(_totaal);
    print(_total.value);
  }
  complete(ListModel item){
    DBProvider.db.complete(item);
    fetchTask();
  }
  update(bool yes, int id){
    ListModel item = ListModel(id: id, tuesday: yes);

    DBProvider.db.delete2(item);
    fetchTask();
  }
  update2(ListModel item){
    DBProvider.db.deleteTest2(ListModel(id: item.id,description: item.description,duration: item.duration,
        completed: item.completed,monday: item.monday,tuesday: false,wednesday: item.wednesday,thursday: item.thursday,friday: item.friday,saturday: item.saturday,sunday: item.sunday));
    fetchTask();
  }

}
class WednesdayBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<ListModel>>();
  final _total = BehaviorSubject<int>();
  final _day = StreamController<List<ListModel>>.broadcast();



  Stream<String> get description => _description.stream;
  Stream<int> get sum => _total.stream;

  get tasks => _taskController.stream;
  get day => _day.stream;

  Function(String)get addTask => _description.sink.add;
  Function(int)get total => _total.sink.add;


  dispose(){
    _taskController.close();
    _description.close();
    _allTasks.close();
    _total.close();
    _day.close();

  }
  WednesdayBloc(){
    fetchTask();
  }

  fetchTask()async{
    final ids = await DBProvider.db.wednesday();
    _taskController.sink.add(ids);
  }
  delete(int id){
    DBProvider.db.deleteTask(id);
    fetchTask();
  }
  totalTime()async{
    int _totaal = await DBProvider.db.calculateTotal2('wednesday');
    _total.sink.add(_totaal);
  }
  complete(ListModel item){
    DBProvider.db.complete(item);
    fetchTask();
  }
  update2(ListModel item){
    DBProvider.db.deleteTest2(ListModel(id: item.id,description: item.description,duration: item.duration,
        completed: item.completed,monday: item.monday,tuesday: item.tuesday,wednesday: false,thursday: item.thursday,friday: item.friday,saturday: item.saturday,sunday: item.sunday));
    fetchTask();
  }
  deleteDay(String today){
    DBProvider.db.deleteADay(today);
    fetchTask();

  }
}

class ThursdayBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<ListModel>>();
  final _total = BehaviorSubject<int>();
  final _day = StreamController<List<ListModel>>.broadcast();



  Stream<String> get description => _description.stream;
  Stream<int> get sum => _total.stream;

  get tasks => _taskController.stream;
  get day => _day.stream;

  Function(String)get addTask => _description.sink.add;
  Function(int)get total => _total.sink.add;


  dispose(){
    _taskController.close();
    _description.close();
    _allTasks.close();
    _total.close();
    _day.close();

  }
  ThursdayBloc(){
    fetchTask();
  }

  submitTask(){
    final validTask = _description.value;

    print('item is $validTask');
  }

  fetchTask()async{
    final ids = await DBProvider.db.thursday();
    _taskController.sink.add(ids);
  }
  delete(int id){
    DBProvider.db.deleteTask(id);
    fetchTask();
  }
  totalTime()async{
    int _totaal = await DBProvider.db.calculateTotal2('thursday');
    _total.sink.add(_totaal);
    print(_total.value);
  }
  complete(ListModel item){
    DBProvider.db.complete(item);
    fetchTask();
  }
  update(bool yes, int id){
    ListModel item = ListModel(id: id, tuesday: yes);

    DBProvider.db.delete2(item);
    fetchTask();
  }
  update2(ListModel item){
    DBProvider.db.deleteTest2(ListModel(id: item.id,description: item.description,duration: item.duration,
        completed: item.completed,monday: item.monday,tuesday: item.tuesday,wednesday: item.wednesday,thursday: false,friday: item.friday,saturday: item.saturday,sunday: item.sunday));
    fetchTask();
  }

}
class FridayBloc{

  final _taskController = StreamController<List<ListModel>>.broadcast();
  final _description = BehaviorSubject<String>();
  final _allTasks = PublishSubject<List<ListModel>>();
  final _total = BehaviorSubject<int>();
  final _day = StreamController<List<ListModel>>.broadcast();



  Stream<String> get description => _description.stream;
  Stream<int> get sum => _total.stream;

  get tasks => _taskController.stream;
  get day => _day.stream;

  Function(String)get addTask => _description.sink.add;
  Function(int)get total => _total.sink.add;


  dispose(){
    _taskController.close();
    _description.close();
    _allTasks.close();
    _total.close();
    _day.close();

  }
  FridayBloc(){
    fetchTask();
  }

  fetchTask()async{
    final ids = await DBProvider.db.friday();
    _taskController.sink.add(ids);
  }
  delete(int id){
    DBProvider.db.deleteTask(id);
    fetchTask();
  }
  totalTime()async{
    int _totaal = await DBProvider.db.calculateTotal2('friday');
    _total.sink.add(_totaal);
  }
  complete(ListModel item){
    DBProvider.db.complete(item);
    fetchTask();
  }
  update2(ListModel item){
    DBProvider.db.deleteTest2(ListModel(id: item.id,description: item.description,duration: item.duration,
        completed: item.completed,monday: item.monday,tuesday: item.tuesday,wednesday: item.wednesday,thursday: item.thursday,friday: false,saturday: item.saturday,sunday: item.sunday));
    fetchTask();
  }
}


