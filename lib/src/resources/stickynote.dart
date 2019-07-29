import 'package:flutter/material.dart';
import 'dart:math';
import 'package:page_transition/page_transition.dart';
import 'package:more_bloc_testing/src/bloc/colorBloc.dart';
import 'package:more_bloc_testing/src/bloc/colorsBloc.dart';
import 'dart:async';
import 'package:random_color/random_color.dart';

class StickyNote extends StatefulWidget {
  StickyNote({
    Key key,
    this.text,
    this.route,
    this.color1,
    this.noteColor,
    this.animate,
    this.swap1,
    this.swap2,
  }) : super(key: key);

  final String text;
  final String route;
  final Color color1;
  final Color noteColor;
  final double animate;
  final Function swap1;
  final String swap2;

  @override
  _StickyNoteState createState() => _StickyNoteState();
}

class _StickyNoteState extends State<StickyNote> with TickerProviderStateMixin {
  final colorBloc = ColorBloc();
  Animation<double> noteAnimation;
  AnimationController noteController;
  Animation<double> deleteAnimation;
  AnimationController deleteController;
  double value1 = 0.0;
  double value2 = pi * .075;
  double valueD1 = 1.0;
  double valueD2 = 10.0;

  Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  @override
  void initState() {
    super.initState();

    noteController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    noteAnimation = Tween(
      begin: value1,
      end: value2,
    ).animate(
      CurvedAnimation(parent: noteController, curve: Curves.elasticIn),
    );
    noteAnimation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          noteController.reverse();
        } else {}
      },
    );
    deleteController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    deleteAnimation = Tween(
      begin: valueD1,
      end: valueD2,
    ).animate(
      CurvedAnimation(parent: deleteController, curve: Curves.linear),
    );
    deleteAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 2), () {
          deleteController.reverse();
        });
      } else {}
    });
  }

  @override
  void dispose() {
    noteController.dispose();
    deleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 105,
        height: 129,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, widget.route);
          },
          onLongPress: () {
            noteController.forward();
            deleteController.forward();
            Future.delayed(Duration(milliseconds: 750),
                    (){
                  widget.swap1(widget.swap2);
                }
            );
          },
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 13,
                    color: Colors.transparent,
                  ),
                  AnimatedBuilder(
                    animation: noteAnimation,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: widget.noteColor,
                            //hexToColor('#9eb1cd'),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.8),
                                offset: Offset.fromDirection(5.0, -4.0),
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              widget.text,
                              style: TextStyle(
                                fontFamily: "Brownbag",
                                fontSize: 65,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 15,
                          decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.srcATop,
                            color: Colors.black.withOpacity(.2),
                          ),
                        ),
                      ],
                    ),
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: noteAnimation.value,
                        child: child,
                        alignment: Alignment(0.0, -.5),
                      );
                    },
                  ),
                ],
              ),
              Positioned(
                left: 45,
                bottom: 97,
                child: Container(
                  child: thumbtack(
                    color: Colors.lime[400],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget thumbtack({Key key, Color color}) {
    return Container(
      child: Container(
        width: 25,
        height: 30,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              left: 7,
              child: Transform.rotate(
                angle: pi / 5.0,
                child: Container(
                  height: 16,
                  width: 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black26,
                      Colors.black26,
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                        color: Colors.black38.withOpacity(.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(5),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      top: 7,
                      child: Container(
                        height: 1,
                        width: 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                spreadRadius: 3.0,
                                blurRadius: 3.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WrapNote extends StatefulWidget {
  WrapNote({Key key, this.stream, this.colorPref, this.day, this.route})
      : super(key: key);

  final Stream stream;
  final String colorPref;
  final String day;
  final String route;

  @override
  _WrapNoteState createState() => _WrapNoteState();
}

class _WrapNoteState extends State<WrapNote> {
  final bloc2 = ColorsBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onDoubleTap: () {
              bloc2.changeColor1(widget.colorPref);
            },
            child: StickyNote(
              color1: Colors.redAccent,
              noteColor: Color(snapshot.data),
              text: widget.day,
              route: widget.route,
            ),
          );
        } else {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onDoubleTap: () {
              bloc2.changeColor1(widget.colorPref);
              bloc2.getColor1(widget.colorPref);
            },
            child: StickyNote(
              color1: Colors.redAccent,
              noteColor: Colors.blue,
              text: widget.day,
              route: widget.route,
            ),
          );
        }
      },
    );
  }
}
