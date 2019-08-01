import 'package:flutter/material.dart';
import 'src/screens/homepage.dart';
import 'src/bloc/provider.dart';
import 'package:more_bloc_testing/src/screens/library.dart';
import 'package:flutter/rendering.dart';

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





  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return LogoScreen();
  }
}




