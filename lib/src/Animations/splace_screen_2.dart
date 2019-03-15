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
      body: Column(
        children: <Widget>[
          Container(
            child: Text('My Daily \n Productivity',textAlign: TextAlign.center,style: TextStyle(fontSize: 60.0),),
          ),
            Container(
              height: 400,
              width: 400,
              child: Center(
                child: FlareActor(
//              ImagePath.SOLAR_FLARE,
                  "assets/zztest.flr",
                  animation: "animation",
                ),
              ),
            ),
          ],
      ),
    );
  }
}