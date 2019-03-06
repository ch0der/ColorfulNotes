import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/screens/homepage.dart';

void main() {
  runApp(Provider(
    child: MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => HomePage(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/second': (context) => AddToList(),
        '/third': (context) => ViewList(),
      },
    ),
  ));
}



