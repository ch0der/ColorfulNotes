import 'taskBloc.dart';
import 'noteBloc.dart';

class MasterBloc {
  TaskBloc _taskBloc;
  NoteBloc _noteBloc;

  MasterBloc(){
    _taskBloc = TaskBloc();
    _noteBloc = NoteBloc();

  }


  TaskBloc get taskBloc => _taskBloc;
  NoteBloc get noteBloc => _noteBloc;


}
