import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/colorsBloc.dart';
import 'src/screens/homepage.dart';
import 'src/bloc/provider.dart';
import 'package:more_bloc_testing/src/screens/library.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'src/bloc/colorsBloc.dart';

void main() {
  debugPaintSizeEnabled=false;

  runApp(Provider(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO LIST',
      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => MyApp(),
        '/second':(context) => HomePage(),
        '/third':(context) => FlareWriter(),
        '/fourth':(context) => ListViewer(),
        '/fifth':(context) => NoteAdder(),
        '/monday':(context) => MondayList(),
        '/tuesday':(context) => TuesdayList(),
        '/wednesday':(context) => WednesdayList(),
        '/thursday':(context) => ThursdayList(),
        '/friday':(context) => FridayList(),
        '/saturday':(context) => SaturdayList(),
        '/sunday':(context) => SundayList(),
        '/temp':(context) => LogoScreen(),
        // When we navigate to the "/second" route, build the SecondScreen Widget

      },
    ),
  ),);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final bloc = ColorsBloc();

  Future<void> startupColor()async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color1');

    if(color1 == null){
      bloc.changeColor1('color1');
      bloc.changeColor1('color2');
      bloc.changeColor1('color3');
      bloc.changeColor1('color4');
      bloc.changeColor1('color5');
      bloc.changeColor1('color6');
      bloc.changeColor1('color7');


    }else{}
  }




  @override
  void initState() {
    super.initState();
    startupColor();

  }

  @override
  Widget build(BuildContext context) {
    return LogoScreen();
  }
}




