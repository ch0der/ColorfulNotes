import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/colorBloc.dart';
export 'colorBloc.dart';

class ColorProvider extends InheritedWidget{
  final colorBloc = ColorBloc();  //creates a new instance of a bloc everytime we call the provider

  ColorProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true; //the underscore means i dont care about this arguement for this particular function
  static ColorBloc of(BuildContext context){
    return(context.dependOnInheritedWidgetOfExactType<ColorProvider>()as ColorProvider).colorBloc; //as Provider tells dart the type being returned, which is an instance of Provider and not an inheritedWidget
    //adding .bloc means we want to pull bloc out of the 'of' function
  }
}