import 'package:flutter/material.dart';
import 'dart:math' as math;

class StickyNote extends StatefulWidget {
  StickyNote({
    Key key,
    this.text,
    this.color1,
    this.color2,
  }) : super(key: key);

  final Color color1;
  final Color color2;
  final String text;

  @override
  _StickyNoteState createState() => _StickyNoteState();
}

class _StickyNoteState extends State<StickyNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 129,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 105,
                height: 18,
                color: Colors.transparent,
              ),
              Container(
                width: 105,
                height: 15,
                decoration: BoxDecoration(
                  color: widget.color2,
                ),
              ),
              Container(
                height: 90,
                width: 105,
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
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 5,
                      bottom: 10,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontFamily: "Brownbag",
                          fontSize: 75,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left:45,
            bottom: 97,
            child: Container(
              child: thumbtack(color: Colors.lime),
            ),
          ),
        ],
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
              top: 13,
              left: 7,
              child: Transform.rotate(
                angle: math.pi / 5.0,
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
