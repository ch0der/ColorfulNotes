import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../resources/list_model.dart';
import '../resources/list_db.dart';

class NoteBloc{
  final _noteController = StreamController<List<HomeScreenNote>>.broadcast();
  final _description = BehaviorSubject<String>();

  get note => _noteController.stream;
  Stream<String> get description => _description.stream;
  Function(String)get addNote => _description.sink.add;

  dispose(){
    _noteController.close();
    _description.close();
  }
  getNote()async{
    final ids = await DBProvider.db.getNote();
    _noteController.sink.add(ids);

  }

  NoteBloc(){
    getNote();
  }

  delete(int id2){
    DBProvider.db.deleteNote(id2);
    getNote();
  }
  add(String str)async{



    HomeScreenNote item = HomeScreenNote(note: str);

    DBProvider.db.nuke();
    DBProvider.db.newNote(item);
    getNote();
  }
  submitTask(){
    final validTask = _description.value;

    print('item is $validTask');
  }
  getThis(int id2){
    DBProvider.db.getTheNote(id2);


  }
  update(String str, int id2){
    HomeScreenNote item = HomeScreenNote(id2: id2, note: str);

    DBProvider.db.updateNote(item);
    getNote();

  }
  erase()async{
    DBProvider.db.nuke();
    getNote();
  }
}