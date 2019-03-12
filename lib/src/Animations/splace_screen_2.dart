import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';


class FlarePage extends StatefulWidget {
  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<FlarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flare Animation"),
      ),
      body: Container(
        child: Center(
          child: Center(
            child: FlareActor(
//              ImagePath.SOLAR_FLARE,
              "assets/zztest.flr",
              animation: "animation",
            ),
          ),
        ),
      ),
    );
  }
}