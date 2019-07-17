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
import 'package:more_bloc_testing/src/bloc/colorBloc.dart';
import 'package:more_bloc_testing/src/bloc/color_provider.dart';
import 'package:random_color/random_color.dart';
import 'package:page_transition/page_transition.dart';
import 'package:more_bloc_testing/src/screens/home_screen_note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/bloc/colorsBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double deleteColor1 = 0;
  final double deleteColor2 = 0;
  //Color _color = Colors.indigo[50];

  final bloc = NoteBloc();
  final colorsBloc = ColorsBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    colorsBloc.getColors();
  }

  String _noteColor1 = 'bdb3c7';
  Color _testColor = Colors.black54;
  Color _buttonColor = Colors.lime[400];
  final _rnd = RandomColor();







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
          notes(colorsBloc),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
          ),
          whiteBoard(),
          Padding(
            padding: EdgeInsets.only(top: 14),
          ),
          Container(
            height: 65,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  child: Stack(
                    children: <Widget>[
                      SlidingDrawer(),
                      Positioned(
                        top: 5,
                        left: 150,
                        child: eraser(),),
                      
                    ],
                  )
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
    return Row(
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
                color: _testColor,
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
      onLongPress: (){
        setState(() {
          _buttonColor = _rnd.randomColor();
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _buttonColor,
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
    return Draggable(

      onDragStarted: (){
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
      childWhenDragging: Container(),
      feedback: Container(
        width: 50,
        height: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/eraser.png'),
            ),),
      ),
      child: Container(
        width: 50,
        height: 40,
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
  Widget notes(ColorsBloc bloc2) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream: bloc2.color1,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onDoubleTap: () {
                        bloc2.changeColor1('color1');
                      },
                      child: StickyNote(
                        color1: Colors.redAccent,
                        noteColor: Color(snapshot.data),
                        text: 'MON',
                        route: '/monday',
                      ),
                    );
                  } else return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onDoubleTap: (){
                      bloc2.changeColor1('color1');

                    } ,
                    child: StickyNote(
                      color1: Colors.redAccent,
                      noteColor: _rnd.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light),
                      text:'FAL',
                      route: '/tuesday',
                    ),
                  );
                }
            ),
            notePaddingR(),
            notePaddingL(),
            StreamBuilder(
                stream: bloc2.color2,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onDoubleTap: () {
                        bloc2.changeColor2('color2');
                      },
                      child: StickyNote(
                        color1: Colors.redAccent,
                        noteColor: Color(snapshot.data),
                        text: 'TUE',
                        route: '/tuesday',
                      ),
                    );
                  } else return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onDoubleTap: (){
                      bloc2.changeColor2('color2');

                    } ,
                    child: StickyNote(
                      color1: Colors.redAccent,
                      noteColor: _rnd.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light),
                      text:'FAL',
                      route: '/tuesday',
                    ),
                  );
                }
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream: bloc2.color3,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onDoubleTap: () {
                        bloc2.changeColor3('color3');
                      },
                      child: StickyNote(
                        color1: Colors.redAccent,
                        noteColor: Color(snapshot.data),
                        text: 'WED',
                        route: '/wednesday',
                      ),
                    );
                  } else return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onDoubleTap: (){
                      bloc2.changeColor3('color3');

                    } ,
                    child: StickyNote(
                      color1: Colors.redAccent,
                      noteColor: _rnd.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light),
                      text:'FAL',
                      route: '/tuesday',
                    ),
                  );
                }
            ),
            notePaddingR(),
            notePaddingL(),
            StreamBuilder(
                stream: bloc2.color4,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onDoubleTap: () {
                        bloc2.changeColor4('color4');
                      },
                      child: StickyNote(
                        color1: Colors.redAccent,
                        noteColor: Color(snapshot.data),
                        text: 'THU',
                        route: '/thursday',
                      ),
                    );
                  } else return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onDoubleTap: (){
                      bloc2.changeColor4('color4');

                    } ,
                    child: StickyNote(
                      color1: Colors.redAccent,
                      noteColor: _rnd.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light),
                      text:'FAL',
                      route: '/tuesday',
                    ),
                  );
                }
            ),
            notePaddingR(),
            notePaddingL(),
            StreamBuilder(
                stream: bloc2.color5,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onDoubleTap: () {
                        bloc2.changeColor5();
                      },
                      child: StickyNote(
                        color1: Colors.redAccent,
                        noteColor: Color(snapshot.data),
                        text: 'FRI',
                        route: '/tuesday',
                      ),
                    );
                  } else return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onDoubleTap: (){
                      bloc2.changeColor5();

                    } ,
                    child: StickyNote(
                      color1: Colors.redAccent,
                      noteColor: _rnd.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light),
                      text:'FAL',
                      route: '/tuesday',
                    ),
                  );
                }
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream: bloc2.color6,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onDoubleTap: () {
                        bloc2.changeColor6('color6');
                      },
                      child: StickyNote(
                        color1: Colors.redAccent,
                        noteColor: Color(snapshot.data),
                        text: 'SAT',
                        route: '/tuesday',
                      ),
                    );
                  } else return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onDoubleTap: (){
                      bloc2.changeColor6('color6');

                    } ,
                    child: StickyNote(
                      color1: Colors.redAccent,
                      noteColor: _rnd.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light),
                      text:'FAL',
                      route: '/tuesday',
                    ),
                  );
                }
            ),
            notePaddingR(),
            notePaddingL(),
            StreamBuilder<Object>(
                stream: bloc2.color7,
                builder: (context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onDoubleTap: () {
                        bloc2.changeColor7();
                      },
                      child: StickyNote(
                        color1: Colors.redAccent,
                        noteColor: Color(snapshot.data),
                        text: 'SUN',
                        route: '/tuesday',
                      ),
                    );
                  } else return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onDoubleTap: (){
                      bloc2.changeColor7();

                    } ,
                    child: StickyNote(
                      color1: Colors.redAccent,
                      noteColor: _rnd.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light),
                      text:'TST',
                      route: '/tuesday',
                    ),
                  );
                }
            ),
          ],
        ),
      ],
    );
  }
  notePaddingR(){
    return Padding(padding: EdgeInsets.only(right: 7),);
  }
  notePaddingL(){
    return Padding(padding: EdgeInsets.only(left: 7),);
  }
}
