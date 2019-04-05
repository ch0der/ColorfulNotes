import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/bloc/provider.dart';

class FlareWriter extends StatefulWidget {
  final bool isPaused;
  FlareWriter({this.isPaused});

  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<FlareWriter> {
  String _animaName;
  bool _selected = false;
  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  bool _selected5 = false;
  bool _selected6 = false; //for daySelectors

  String _animation1;
  String _animation;
  int sDuration;
  int ticker;
  double stepValue;
  int newNumber =0;
  int _defaultValue = 0; //for timeSelector



  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).taskBloc;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[padder(),
            dayButton(bloc, "S"),dayButton1(bloc, "M"),dayButton2(bloc, "T"),dayButton3(bloc, "W"),dayButton4(bloc, "T"),dayButton5(bloc, "F"),dayButton6(bloc, "S"),

          ],
        ),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        Row(
          children: <Widget>[Padding(padding: EdgeInsets.only(left: 15.0),),
          box(5),box(15),box(30),box(45),box(60),Padding(padding: EdgeInsets.only(left: 2.5),),counter(),
          ],
        ),
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(child: flareWriter()),
            submit(bloc),

          ],
        ),
      ],
    );
  }

  Widget submit(TaskBloc bloc){
    return  StreamBuilder(
      stream: bloc.description,
      builder: (context, snapshot) {
        return Positioned(
          left: 71.0,
          top: 42.0,
          child: Container(
            width: 110.0,
            height: 42.0,
            child: GestureDetector(
              onTap: ()async{
                if(_animaName ==null){
                  onTap();

                }else{
                  //return nothing
                }
                if (snapshot.hasData){
                  bloc.add(_selected, _selected1, _selected2,_selected3,_selected4,_selected5,_selected6, newNumber);
                  setState(() {
                    _selected = false;
                  });
                }
                newNumber = 0;
                _defaultValue =0;
                setState(() {
                });
              },
            ),
          ),
        );
      }
    );
  }

  Widget flareWriter(){
    return Container(
      height: 200,
      width: 250,
      child: Center(
        child: FlareActor("assets/SubmitFolder5.flr",
            animation: _animaName,

            ),
      ),
    );
  }
  Widget flareStart(){
    return Container(
      height: 200,
      width: 250,
      child: Center(
        child: FlareActor("assets/SubmitFolder5.flr",
          animation: "animation2",
        ),
      ),
    );
  }
  onTap()async{
    setState(() {
      _animaName = "animation2";
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _animaName = null;
    });
  }

  Widget padder(){
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
    );
  }

  Widget dayButton(TaskBloc bloc, String day){


    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: ()async{
            setState(() {
              _selected = !_selected;

            });
          },

        ),
      ),
    );
  }
  Widget dayButton1(TaskBloc bloc, String day){


    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected1 == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: ()async{
            setState(() {
              _selected1 = !_selected1;

            });
          },

        ),
      ),
    );
  }
  Widget dayButton2(TaskBloc bloc, String day){


    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected2 == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: ()async{
            setState(() {
              _selected2 = !_selected2;

            });
          },

        ),
      ),
    );
  }
  Widget dayButton3(TaskBloc bloc, String day){


    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected3 == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: ()async{
            setState(() {
              _selected3 = !_selected3;

            });
          },

        ),
      ),
    );
  }
  Widget dayButton4(TaskBloc bloc, String day){


    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected4 == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: ()async{
            setState(() {
              _selected4 = !_selected4;

            });
          },

        ),
      ),
    );
  }
  Widget dayButton5(TaskBloc bloc, String day){


    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected5 == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: ()async{
            setState(() {
              _selected5 = !_selected5;

            });
          },

        ),
      ),
    );
  }
  Widget dayButton6(TaskBloc bloc, String day){


    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(

        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected6 == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent ,
          onPressed: ()async{
            setState(() {
              _selected6 = !_selected6;

            });
          },

        ),
      ),
    );
  }

  Widget box(sDuration){
    final int tick = sDuration;

    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      height: 50.0,
      width: 55.0,
      child: FlatButton(
          child: Text("$sDuration",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold
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
      decoration: BoxDecoration(
        color: Colors.white70
      ),
      height: 50.0,
      width: 105.0,
      child: Center(
        child: Text('$newNumber',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize:35.0 ) ,),
      ),
    );
  }
}
