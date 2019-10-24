import 'dart:ui';
import 'package:more_bloc_testing/src/Animations/drawer_homepage.dart';
import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
export 'package:more_bloc_testing/main.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:more_bloc_testing/src/bloc/noteBloc.dart';
import 'package:more_bloc_testing/src/resources/stickynote.dart';
import 'package:random_color/random_color.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/bloc/colorsBloc.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double deleteColor1 = 0;
  final double deleteColor2 = 0;
  //Color _color = Colors.indigo[50];
  Animation<double> deleteAnimation;
  Animation<double> deleteAnimation2;
  Animation<double> deleteAnimation3;
  Animation<double> deleteAnimation4;
  Animation<double> deleteAnimation5;
  Animation<double> deleteAnimation6;
  Animation<double> deleteAnimation7;
  AnimationController deleteController;
  AnimationController deleteController2;
  AnimationController deleteController3;
  AnimationController deleteController4;
  AnimationController deleteController5;
  AnimationController deleteController6;
  AnimationController deleteController7;

  double value1 = 1;
  double value2 = 0;

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

    deleteController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    deleteController2 = AnimationController(vsync: this,duration: Duration(milliseconds: 750),);
    deleteController3 = AnimationController(vsync: this,duration: Duration(milliseconds: 750),);
    deleteController4 = AnimationController(vsync: this,duration: Duration(milliseconds: 750),);
    deleteController5 = AnimationController(vsync: this,duration: Duration(milliseconds: 750),);
    deleteController6 = AnimationController(vsync: this,duration: Duration(milliseconds: 750),);
    deleteController7 = AnimationController(vsync: this,duration: Duration(milliseconds: 750),);

    deleteAnimation = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: deleteController, curve: Curves.slowMiddle,reverseCurve: Curves.fastLinearToSlowEaseIn),
    );
    deleteAnimation.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          deleteController.reverse();
        } else {}
      },
    );
    deleteAnimation2 = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: deleteController2, curve: Curves.slowMiddle,reverseCurve: Curves.fastLinearToSlowEaseIn),
    );
    deleteAnimation2.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          deleteController2.reverse();
        } else {}
      },
    );
    deleteAnimation3 = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: deleteController3, curve: Curves.slowMiddle,reverseCurve: Curves.fastLinearToSlowEaseIn),
    );
    deleteAnimation3.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          deleteController3.reverse();
        } else {}
      },
    );
    deleteAnimation4 = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: deleteController4, curve: Curves.slowMiddle,reverseCurve: Curves.fastLinearToSlowEaseIn),
    );
    deleteAnimation4.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          deleteController4.reverse();
        } else {}
      },
    );
    deleteAnimation5 = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: deleteController5, curve: Curves.slowMiddle,reverseCurve: Curves.fastLinearToSlowEaseIn),
    );
    deleteAnimation5.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          deleteController5.reverse();
        } else {}
      },
    );
    deleteAnimation6 = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: deleteController6, curve: Curves.slowMiddle,reverseCurve: Curves.fastLinearToSlowEaseIn),
    );
    deleteAnimation6.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          deleteController6.reverse();
        } else {}
      },
    );
    deleteAnimation7 = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: deleteController7, curve: Curves.slowMiddle,reverseCurve: Curves.fastLinearToSlowEaseIn),
    );
    deleteAnimation7.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          deleteController7.reverse();
        } else {}
      },
    );
  }

  Color _testColor = Colors.black54;
  Color _buttonColor = Colors.lime[400];
  Color deleteAllColor = Colors.white;
  final _rnd = RandomColor();
  bool eraserVisible = false;
  bool wedVis = true;

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
                          left: 40,
                          child: eraser(),
                        ),
                      ],
                    )),
                Positioned(
                  left: 330,
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
              height: 130,
              width: 290,
              child: Padding(padding: EdgeInsets.only(top: 20),child: noteViewer(bloc),)
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
            return Theme(
              data: ThemeData(accentColor: _rnd.randomColor(colorSaturation: ColorSaturation.lowSaturation,colorBrightness: ColorBrightness.light)),
              child: ListView.builder(
                controller: ScrollController(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    HomeScreenNote item = snapshot.data[index];
                    return Text(item.note);
                  }),
            );
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
      onLongPress: () {
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
      onDragStarted: () {
        if (deleteColor1 == 0) {
          setState(() {
            deleteColor1 = .5;
          });
        } else {
          setState(() {
            deleteColor1 = 0;
          });
        }
        setState(() {
          eraserVisible = true;
        });
      },
      onDragCompleted: () {
        setState(() {
          deleteColor1 = 0;
          eraserVisible = false;
        });
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        setState(() {
          deleteColor1 = 0;
          eraserVisible = false;
        });
      },
      childWhenDragging: Container(),
      feedback: Container(
        width: 50,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/eraser.png'),
          ),
        ),
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
      data: 1,
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
            noteAnimation(deleteAnimation,note2(bloc2,'MON',bloc2.color1,bloc2.changeColor1,'color1','/monday',bloc2.changeColor1,'color1','monday',deleteController)),
            notePaddingR(),
            Visibility(
              child: eraseTarget(),
              visible: eraserVisible,
            ),
            notePaddingL(),
            AnimatedBuilder(
                animation: deleteAnimation2,
                builder: (context, child) {
                  return Transform.scale(
                      scale: deleteAnimation2.value,
                      child: child
                  );
                },
                child: note2(bloc2,'TUE',bloc2.color2,bloc2.changeColor2,'color2','/tuesday',bloc2.changeColor2,'color2','tuesday',deleteController2)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            noteAnimation(deleteAnimation3,note2(bloc2,'WED',bloc2.color3,bloc2.changeColor3,'color3','/wednesday',bloc2.changeColor3,'color3','wednesday',deleteController3)),
            notePaddingR(),
            notePaddingL(),
            noteAnimation(deleteAnimation4, note2(bloc2,'THU',bloc2.color4,bloc2.changeColor4,'color4','/thursday',bloc2.changeColor4,'color4','thursday',deleteController4)),
            notePaddingR(),
            notePaddingL(),
            noteAnimation(deleteAnimation5,note2(bloc2,'FRI',bloc2.color5,bloc2.changeColor5,'color5','/friday',bloc2.changeColor5,'color5','friday',deleteController5)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            noteAnimation(deleteAnimation6,note2(bloc2,'SAT',bloc2.color6,bloc2.changeColor6,'color6','/saturday',bloc2.changeColor6,'color6','saturday',deleteController6)),
            notePaddingR(),
            notePaddingL(),
            noteAnimation(deleteAnimation7,note2(bloc2,'SUN',bloc2.color7,bloc2.changeColor7,'color7','/sunday',bloc2.changeColor7,'color7','sunday',deleteController7)),
          ],
        ),
      ],
    );
  }

  notePaddingR() {
    return Padding(
      padding: EdgeInsets.only(right: 7),
    );
  }

  notePaddingL() {
    return Padding(
      padding: EdgeInsets.only(left: 7),
    );
  }

  eraseAll() {
    return StickyNote(
      text: 'ALL',
      noteColor: deleteAllColor,
    );
  }

  eraseTarget() {
    final bloc3 = TaskBloc();
    return DragTarget(
      builder: (BuildContext context, List<int> candidateData,
          List<dynamic> rejectedData) {
        return eraseAll();
      },
      onWillAccept: (data) {
        setState(() {
          deleteAllColor = Colors.redAccent;
        });
        return data == 1;
      },
      onLeave: (data) {
        setState(() {
          deleteAllColor = Colors.white;
        });
      },
      onAccept: (data) {
        bloc.erase();
        bloc3.deleteALL();
        deleteController.forward();
        deleteController2.forward();
        deleteController3.forward();
        deleteController4.forward();
        deleteController5.forward();
        deleteController6.forward();
        deleteController7.forward();
        setState(() {
          deleteAllColor = Colors.white;
        });
      },
    );
  }

  deleteWrapper(Widget child, String text, Color color1) {
    return DragTarget(
      builder: (BuildContext context, List<int> candidateData,
          List<dynamic> rejectedData) {
        return child;
      },
      onWillAccept: (data) {
        color1 = Colors.redAccent;
        text = 'DEL';
        return data == 1;
      },
    );
  }
  Widget note2(ColorsBloc bloc2, String day, Stream stream, Function color, String color2,String route,Function swap1, String swap2, String delete,AnimationController controller){
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          String text = day;
          Color noteColor = Color(snapshot.data);

          return DragTarget(
            builder: (BuildContext context, List<int> candidateData,
                List<dynamic> rejectData) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onDoubleTap: () {
                  color(color2);
                },
                child:  StickyNote(
                        noteColor: noteColor,
                        text: text,
                        route: route,
                        swap1: swap1,
                        swap2: swap2,
                      ),
              );
            },
            onLeave: (data) {
              text = day;
              noteColor = Color(snapshot.data);
            },
            onWillAccept: (data) {
              noteColor = Colors.redAccent;
              return data == 1;
            },
            onAccept:(data){

              controller.forward();
              bloc2.deleteDay(delete);


            } ,
          );
        } else
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onDoubleTap: () {
              color(color2);
            },
            child: StickyNote(
              noteColor: _rnd.randomColor(
                  colorSaturation: ColorSaturation.mediumSaturation,
                  colorBrightness: ColorBrightness.light),
              text: 'SUN',
              route: '/tuesday',
            ),
          );
      },
    );
  }
  Widget noteAnimation(Animation animation,Widget child2){
    return AnimatedBuilder(animation:animation, builder: (context, child) {
      return Transform.scale(
          scale: animation.value,
          child: child2
      );
    },
    );
  }

}

