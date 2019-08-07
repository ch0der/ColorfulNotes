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
    if(isPaused == true )
    Future.delayed(Duration(seconds: 20),
        (){
      setState(() {
        isPaused = false;
      });

      }
    );
    if(isPaused == false )
            setState(() {
              isPaused = true;
            });
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
          isPaused = true;
        });
          }
      );
    }
  }
}
