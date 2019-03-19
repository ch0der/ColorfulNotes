import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'dart:math';

class DaySelector extends StatefulWidget {
  @override
  _DaySelectorState createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class HelperTile extends StatefulWidget {
  final String day;

  HelperTile({Key key, this.day}) :super(key:key);

  @override
  _HelperTileState createState() => _HelperTileState();
}

class _HelperTileState extends State<HelperTile> {
   bool _selected = false;



  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(widget.day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: (){
            setState(() {
              _selected = !_selected;

            });
          },

        ),
      ),
    );
  }
}

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<DaySelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class TimeHelperTile extends StatefulWidget {

  @override
  _TimeHelperTileState createState() => _TimeHelperTileState();
}

class _TimeHelperTileState extends State<TimeHelperTile> {
  bool _selected = false;
  String _animation1;
  String _animation;
  int sDuration;
  int ticker;
  double stepValue;
  int newNumber =0;
  int _defaultValue = 0;


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[Padding(padding: EdgeInsets.only(left: 50.0),),
          box(5),box(15),box(30),box(45),box(60),
          ],
        ),
        checkAnimation(),
        counter(),
      ],
    );
  }
  Widget box(sDuration){
    final int tick = sDuration;

    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text("$sDuration",
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: Colors.yellow[100],
          highlightColor: Colors.yellow[400] ,
          onPressed: (){
            setState(() {
              if (_animation == "animation"){

              }else _animation1 ="assets/checkmark.flr";
              _animation = "animation";
            });
            setState(() {
              ticker = _defaultValue+tick;
            });
            setState(() {
              _defaultValue = ticker;
              newNumber = _defaultValue;
            });
            print (newNumber); //TODO add this to a sink ->bloc

          }

        ),
      ),
    );
  }
  Widget checkAnimation(){
    return Container(
      height: 50,
      child: FlareActor(_animation1,animation: _animation,),
    );
  }
  Widget counter(){
    return Container(
      height: 40.0,
      width: 40.0,
      child: Text('$newNumber'),
    );
  }
}
