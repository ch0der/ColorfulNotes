import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';
import 'package:more_bloc_testing/src/widgets/title_.dart';


class FlarePage extends StatefulWidget {
  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<FlarePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightGreen[200],
      child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 200),
              ),
              Stack(
                children: <Widget>[
                  Center(child: Column(
                    children: <Widget>[
                      TitleBackground(),
                      Opacity(
                        opacity: .8,
                        child: Container(
                          height: 250,
                          width: 250,
                          child: Center(
                            child: FlareActor(
//              ImagePath.SOLAR_FLARE,
                              "assets/zztest.flr",
                              animation: "animation",
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
    );
  }
}