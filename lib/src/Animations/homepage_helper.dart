import 'package:flutter/material.dart';
import 'dart:async';
import 'package:page_transition/page_transition.dart';
import 'dart:math'as math;

class DayNote extends StatefulWidget {
  DayNote({Key key, this.dayOf, this.test, this.day}) : super(key: key);

  final String day;
  final String dayOf;
  final Widget test;

  @override
  _DayNoteState createState() => _DayNoteState();
}

class _DayNoteState extends State<DayNote> {
  bool shake = true;
  String animation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 125,
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: widget.test));
          },
          onLongPress: () {
            if (animation == "Untitled") {
            } else {
              setState(() {
                animation = "Untitled";
                shake = false;
              });
              Future.delayed(Duration(milliseconds: 1250), () {
                setState(() {
                  animation = null;
                });
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(widget.dayOf)),
            ),
          ),
        ),
      ),
    );
  }

}
