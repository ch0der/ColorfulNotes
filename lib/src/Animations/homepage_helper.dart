import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:page_transition/page_transition.dart';

class DayNote extends StatefulWidget {
  DayNote({Key key, this.day, this.test}) : super(key: key);

  final String day;
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
      height: 110,
      width: 110,
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap:(){
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: widget.test));
          },
          onLongPress: (){
            if(animation == "Untitled"){} else {
              setState(() {
                animation = "Untitled";
                shake = false;

              });
              Future.delayed(Duration(milliseconds: 1250),(){
                setState(() {
                  animation = null;
                });

              });
            }
          },
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/note2.png'))),
          ),
        ),
      ),
    );
  }
}
