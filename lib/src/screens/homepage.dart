import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
import 'package:more_bloc_testing/src/Animations/plane.dart';
export 'package:more_bloc_testing/main.dart';
import 'package:more_bloc_testing/src/screens/days/monday.dart';
import 'package:more_bloc_testing/src/screens/days/tuesday.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:more_bloc_testing/src/bloc/noteBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.indigo[50];

  final bloc = NoteBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

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
            padding: EdgeInsets.only(top: 25),
          ),
          notes(),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
          ),
          whiteBoard(),
          Padding(padding: EdgeInsets.only(top: 17)),
          addButton(),
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
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              bloc.erase();
            },
            child: Icon(
              Icons.delete_forever,
              size: 55,
              color: Colors.redAccent[100],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 244)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/fifth');
            },
            child: Icon(
              Icons.add_box,
              size: 50,
              color: Colors.lightGreenAccent[100],
            ),
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
      height: 180,
      width: 370,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 5,
            bottom: 130,
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
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              height: 110,
              width: 290,
              child: noteViewer(bloc),
            ),
          ),
        ],
      ),
    );
  }

  Widget noteViewer(NoteBloc bloc) {
    bloc.getNote();
    return StreamBuilder<List<HomeScreenNote>>(
        stream: bloc.note,
        builder: (BuildContext context,
            AsyncSnapshot<List<HomeScreenNote>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  HomeScreenNote item = snapshot.data[index];
                  return Text(item.note);
                });
          } else {
            return Container();
          }
        });
  }

  addButton() {
    return InkWell(
      highlightColor: Colors.green,
      onTap: () {
        Navigator.pushNamed(context, '/third');
      },
      child: Container(
        height: 60,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.lightGreen[200],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.8),
              offset: Offset.fromDirection(5.0, -6.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'NEW TASK',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.8),
                shadows: [
                  Shadow(
                      blurRadius: 2.0,
                      offset: Offset(-2, 2),
                      color: Colors.white24),
                ]),
          ),
        ),
      ),
    );
  }
}
