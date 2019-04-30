import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';


class Checkmark extends StatefulWidget {
  Checkmark({Key key, this.route, this.animation}) : super (key:key);
  final String route; final String animation;

  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<Checkmark> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Center(
        child: FlareActor(
//              ImagePath.SOLAR_FLARE,
          widget.route,
          animation: widget.animation,
        ),
      ),
    );
  }
}