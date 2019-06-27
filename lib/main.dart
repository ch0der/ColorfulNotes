import 'package:flutter/material.dart';
import 'src/screens/homepage.dart';
import 'src/bloc/provider.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/screens/library.dart';
import 'package:flutter/rendering.dart';
import 'package:more_bloc_testing/src/bloc/colorBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        '/third':(context) => BuildList(),
        '/fourth':(context) => ListViewer(),
        '/fifth':(context) => NoteAdder(),
        '/monday':(context) => DayList(),
        '/tuesday':(context) => TuesdayList(heroDay: 'wednesday',),
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





  @override
  void initState() {
    super.initState();
    _getColor1();
    _getColor2();

  }

  Future<int> _getColor1() async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color1');
    if (color1 == null){
      return Colors.yellow[200].value;
    } return color1;

  }
  Future<int> _getColor2() async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color2');
    if (color1 == null){
      return Colors.green[200].value;
    } return color1;

  }


  @override
  Widget build(BuildContext context) {
    return LogoScreen();
  }
}




