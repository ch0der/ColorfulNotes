import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';


class Plane extends StatefulWidget {

  @override
  _PlaneState createState() => _PlaneState();
}

class _PlaneState extends State<Plane> {
  bool isPaused = true;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),
        (){
      setState(() {
        isPaused =! isPaused;
      });

        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return planeAnimation();
  }

  Widget planeAnimation(){
    return Container(
      height: 50,
      child: FlareActor("assets/planeTest.flr", animation: "plane",isPaused: isPaused,),
    );

  }
  pauser()async{
    if (isPaused == false){
      await Future.delayed(Duration(seconds: 8),
          (){
        setState(() {
          isPaused =! isPaused;
        });
          }
      );
    }
  }
}
