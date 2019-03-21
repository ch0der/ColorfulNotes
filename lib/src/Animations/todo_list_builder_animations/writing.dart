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

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).taskBloc;
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(child: flareWriter()),
        submit(bloc),

      ],
    );
  }

  Widget submit(TaskBloc bloc){
    return  StreamBuilder(
      stream: bloc.task,
      builder: (context, snapshot) {
        return Positioned(
          left: 71.0,
          top: 42.0,
          child: Container(
            width: 110.0,
            height: 42.0,
            child: GestureDetector(
              onTap: (){
                if(_animaName ==null){
                  onTap();

                }else{
                  //return nothing
                }
                if (snapshot.hasData){
                  bloc.submitTask();
                }
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
}
