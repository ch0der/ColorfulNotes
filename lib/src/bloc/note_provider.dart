import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/noteBloc.dart';
export 'taskBloc.dart';

class NoteProvider extends InheritedWidget{
  final NoteBloc bloc;

  NoteProvider({Key key, Widget child})
      : bloc = NoteBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;
  static NoteBloc of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(NoteProvider)
    as NoteProvider)
        .bloc;
  }
}