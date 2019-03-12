import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../widgets/todo_day.dart';

class BuildList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          title(),
          doListViewer(),
          daySelect(),

        ],
      ),
    );
  }
  Widget title(){
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text('Add New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 50.0),

      ),
    );
  }

  Widget doListViewer(){
    return TextField(
      decoration: InputDecoration(
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelText: 'Enter Here',
      ),


    );
  }

  Widget daySelect(){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: Text('Day',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),),
        ),
        Row(
          children: <Widget>[Padding(padding: EdgeInsets.only(left: 14.0),),
            HelperTile(day: 'S'), HelperTile(day: 'M'), HelperTile(day: 'T'), HelperTile(day: 'W'),
            HelperTile(day: 'T'), HelperTile(day: 'F'), HelperTile(day: 'S'),
          ],
        ), //../widgets/todo_day
      ],
    );
  }

}
class FlareWriter extends StatefulWidget {

  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<FlareWriter> {
  bool animacontroller;

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
          isPaused: animacontroller,
        ),
      ),
    );
  }
}