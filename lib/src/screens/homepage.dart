import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
import 'package:more_bloc_testing/src/Animations/plane.dart';
export 'package:more_bloc_testing/main.dart';
import 'package:more_bloc_testing/src/screens/days/monday.dart';
import 'package:more_bloc_testing/src/screens/days/tuesday.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.indigo[200];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/cork3.jpg'))),
        child: buildHomePage(context),
      ),
    );
  }

  Widget buildHomePage(context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 75),
          ),
          notes(),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          whiteBoard(),
        ],
      ),
    );
  }

  Widget notes() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: 'monday',
                child: DayNote(
                    day: '/monday',
                    test: MondayList(),
                    dayOf: 'assets/note2.png')),
            DayNote(dayOf: 'assets/noteTuesday.png'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DayNote(dayOf: 'assets/noteWed.png'),
            DayNote(dayOf: 'assets/noteThur.png'),
            DayNote(dayOf: 'assets/noteFri.png')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DayNote(dayOf: 'assets/noteSat.png'),
            DayNote(dayOf: 'assets/noteSun.png')
          ],
        ),
      ],
    );
  }

  Widget heroHelper(String tag, String day, Widget day1) {
    return Hero(
      tag: tag,
      child: DayNote(
        day: day,
        test: day1,
      ),
    );
  }

  Widget bottomBar() {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _color = Colors.pink;
              });

              Navigator.pushNamed(context, '/third');
            },
            child: Icon(
              Icons.add_circle,
              size: 70,
              color: _color,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          RaisedButton(
            child: Text('test'),
            onPressed: () {
              Navigator.pushNamed(context, '/fourth');
            },
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          RaisedButton(
            child: Text('test'),
            onPressed: () {
              Navigator.pushNamed(context, '/fifth');
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Material(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white.withOpacity(.5),
            child: Container(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  _color = Colors.lightGreen;
                });
              },
              child: Icon(
                Icons.settings,
                size: 60,
                color: Colors.indigoAccent,
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget whiteBoard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[350],
          width: 8.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.8),
            offset: Offset.fromDirection(5.0, -6.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      height: 200,
      width: 370,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 5,
            bottom: 150,
            child: Text(
              'Quick Notes:',
              style: TextStyle(
                fontFamily: "Brownbag",
                fontSize: 40,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomBar(),
          ),
          boxNote(),
        ],
      ),
    );
  }

  Widget boxNote() {
    return Container(
      child: TextField(
        onChanged: null,
        maxLines: 4,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
