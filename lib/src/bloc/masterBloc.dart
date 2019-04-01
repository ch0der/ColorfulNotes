import 'taskBloc.dart';

class MasterBloc {
  TaskBloc _taskBloc;

  MasterBloc(){
    _taskBloc = TaskBloc();

  }


  TaskBloc get taskBloc => _taskBloc;



}
