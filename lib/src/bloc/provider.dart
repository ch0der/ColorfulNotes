import 'package:flutter/material.dart';
import 'masterBloc.dart';

class Provider extends InheritedWidget{
  final bloc = MasterBloc();  //creates a new instance of a bloc everytime we call the provider

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true; //the underscore means i dont care about this arguement for this particular function
  static MasterBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        .bloc; //as Provider tells dart the type being returned, which is an instance of Provider and not an inheritedWidget
    //adding .bloc means we want to pull bloc out of the 'of' function
  }
}
