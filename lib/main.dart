import 'package:flutter/material.dart';
import 'src/screens/homepage.dart';
import 'src/bloc/provider.dart';
import 'src/Animations/splace_screen_2.dart';
import 'dart:async';
import 'src/screens/todo_list_builder.dart';
import 'package:flutter/rendering.dart';
import 'src/bloc/masterBloc.dart';

void main() {
  debugPaintSizeEnabled=true;
  runApp(Provider(
    child: MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => MyApp(),
        '/second':(context) => HomePage(),
        '/third':(context) => BuildList(),
        // When we navigate to the "/second" route, build the SecondScreen Widget

      },
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      (){
        Navigator.pushNamed(context, '/second');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlarePage();
  }
}




