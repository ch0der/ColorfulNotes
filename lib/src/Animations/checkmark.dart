import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';


class Checkmark extends StatefulWidget {
  Checkmark({Key key, this.route, this.animation,}) : super (key:key);
  final String route; final String animation;

  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<Checkmark> {
  bool isPaused = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        setState(() {
         isPaused = false;
        });
      },
      child: Container(
        color: Colors.transparent,
        height: 50,
        width: 50,
        child: Center(
          child: FlareActor(
//              ImagePath.SOLAR_FLARE,
            "assets/checkmark2.flr",
            animation: "animation",
            isPaused: isPaused,
          ),
        ),
      ),
    );
  }
}