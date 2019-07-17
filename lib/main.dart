import 'package:flutter/material.dart';
import 'src/screens/homepage.dart';
import 'src/bloc/provider.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/screens/library.dart';
import 'package:flutter/rendering.dart';
import 'package:more_bloc_testing/src/bloc/colorBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:random_color/random_color.dart';

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
        '/wednesday':(context) => WednesdayList(heroDay: 'wednesday',),
        '/thursday':(context) => ThursdayList(heroDay: 'thursday',),
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

  RandomColor _randomColor;





  @override
  void initState() {
    super.initState();

  }

  Future _getColors() async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.lowSaturation,colorBrightness: ColorBrightness.light).value;
    final int test = Colors.pink.value;
    await prefs.setInt('color1',test);
    await prefs.setInt('color2',test);
  }
  Future _getColor1() async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color1');
    final int test = Colors.pink.value;
    if (color1 == null){
      await prefs.setInt('color1', test);
    } else {}

  }
  Future _getColor2() async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color2');
    final int test = Colors.yellowAccent.value;
    if (color1 == null){
      await prefs.setInt('color2', test);
    } else {}
  }


  @override
  Widget build(BuildContext context) {
    return LogoScreen();
  }
}




