import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';


class FlareWriter extends StatefulWidget {

  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<FlareWriter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: Center(
          child: FlareActor(

//              ImagePath.SOLAR_FLARE,
            "assets/zztest.flr",
            animation: "animation",
            isPaused: true,
          ),
        ),
    );
  }
}