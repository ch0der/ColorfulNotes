import 'dart:async';
import 'package:rxdart/rxdart.dart';


import '../resources/list_model.dart';
import '../resources/list_db.dart';
import 'taskBloc.dart';

class MasterBloc {
  TaskBloc _taskBloc;

  MasterBloc(){
    _taskBloc = TaskBloc();

  }


  TaskBloc get taskBloc => _taskBloc;



}
