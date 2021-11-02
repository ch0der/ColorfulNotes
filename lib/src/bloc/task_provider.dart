import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
export 'taskBloc.dart';

class TaskProvider extends InheritedWidget{
  final TaskBloc bloc;

  TaskProvider({Key key, Widget child})
      : bloc = TaskBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;
  static TaskBloc of(BuildContext context){
    return(context.dependOnInheritedWidgetOfExactType<TaskProvider>()
    as TaskProvider)
        .bloc;
  }
}