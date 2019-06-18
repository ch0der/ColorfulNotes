import 'dart:ui';
import 'package:more_bloc_testing/src/Animations/drawer_homepage.dart';
import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
export 'package:more_bloc_testing/main.dart';
import 'package:more_bloc_testing/src/screens/days/monday.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:more_bloc_testing/src/bloc/noteBloc.dart';
import 'package:more_bloc_testing/src/screens/days/tuesday_test(click_wednesday).dart';
import 'package:more_bloc_testing/src/resources/stickynote.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double deleteColor1 = 0;
  final double deleteColor2 = 0;
  //Color _color = Colors.indigo[50];

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
              fit: BoxFit.cover,
              image: AssetImage('assets/cork3.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black87.withOpacity(deleteColor1), BlendMode.darken)),
        ),
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
          Padding(
            padding: EdgeInsets.only(top: 17),
          ),
          Container(
            height: 70,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  child: SlidingDrawer(),
                ),
                Positioned(
                  left: 300,
                  child: addButton(),
                ),
              ],
            ),
          ),
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
                    test: DayList(
                      heroDay: 'monday',
                      noteImg: 'assets/note2.png',
                    ),
                    dayOf: 'assets/note2.png')),
            Hero(
                tag: 'tuesday',
                child: DayNote(
                    day: '/tuesday',
                    test: DayList(
                      heroDay: 'tuesday',
                      noteImg: 'assets/noteTuesday.png',
                    ),
                    dayOf: 'assets/noteTuesday.png')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'wednesday',
              child: DayNote(
                  day: '/wednesday',
                  test: TuesdayList(
                    heroDay: 'wednesday',
                    noteImg: 'assets/noteWed.png',
                  ),
                  dayOf: 'assets/noteWed.png'),
            ),
            DayNote(dayOf: 'assets/noteThur.png'),
            DayNote(dayOf: 'assets/noteFri.png')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DayNote(dayOf: 'assets/noteSat.png'),
            StickyNote(text: "SUN",color1: Colors.orange[200],color2: Colors.orange[400],)
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
          Padding(padding: EdgeInsets.only(left: 312)),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/fifth');
                },
                child: Icon(
                  Icons.add_box,
                  size: 40,
                  color: Colors.lightGreenAccent[100],
                ),
              ),
              GestureDetector(
                onTap: () {
                  bloc.erase();
                },
                child: Icon(
                  Icons.delete_forever,
                  size: 40,
                  color: Colors.redAccent[100],
                ),
              ),
            ],
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
              'Notes:',
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
      onTap: () {
        Navigator.pushNamed(context, '/third');
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.lightGreen[200],
          borderRadius: BorderRadius.circular(30.0),
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
            '+',
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

  addButton2() {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.add_circle,
        size: 72,
        color: Colors.green,
      ),
    );
  }

  eraser() {
    return GestureDetector(
      onTap: () {
        if (deleteColor1 == 0) {
          setState(() {
            deleteColor1 = .5;
          });
        } else {
          setState(() {
            deleteColor1 = 0;
          });
        }
      },
      child: Container(
        width: 70,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/eraser.png'),
        )),
      ),
    );
  }

  eraserBox() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.redAccent, width: 5),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            spreadRadius: 5,
            blurRadius: 10.0,
          ),
        ],
      ),
    );
  }
}
