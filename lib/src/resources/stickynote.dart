import 'package:flutter/material.dart';
import 'dart:math';
import 'package:random_color/random_color.dart';
import 'dart:async';
import 'package:page_transition/page_transition.dart';

class StickyNote extends StatefulWidget {
  StickyNote({
    Key key,
    this.text,
    this.route,
    this.color1,
  }) : super(key: key);

  final String text;
  final Widget route;
  Color color1;

  @override
  _StickyNoteState createState() => _StickyNoteState();
}

class _StickyNoteState extends State<StickyNote> with TickerProviderStateMixin {
  Animation<double> noteAnimation;
  AnimationController noteController;
  double value1 = 0.0;
  double value2 = pi * .075;
  RandomColor _randomColor = RandomColor();

  @override
  void initState() {
    // TODO: implement initState
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
  }

  onTap() {
    noteController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Color _color1 = widget.color1;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 105,
        height: 129,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 13,
                  color: Colors.transparent,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: widget.route));
                  },
                  onLongPress: () {
                    noteController.forward();
                    Future.delayed(Duration(milliseconds: 550), () {
                      setState(
                        () {
                          widget.color1 = _randomColor.randomColor(
                            colorBrightness: ColorBrightness.light,
                            colorSaturation: ColorSaturation.lowSaturation,
                          );
                        },
                      );
                    });
                  },
                  child: AnimatedBuilder(
                    animation: noteAnimation,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: widget.color1,
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
                ),
              ],
            ),
            Positioned(
              left: 45,
              bottom: 97,
              child: Container(
                child: thumbtack(color: Colors.lime),
              ),
            ),
          ],
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
              top: 8,
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
                        color: Colors.black38.withOpacity(.3),
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
