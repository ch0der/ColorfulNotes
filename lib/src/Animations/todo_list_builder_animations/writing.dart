import "package:flutter/material.dart";
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/bloc/provider.dart';
import 'package:more_bloc_testing/src/Animations/plane.dart';
import 'package:flutter/rendering.dart';

class FlareWriter extends StatefulWidget {
  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<FlareWriter> {
  String _animaName;
  bool planePaused = false;

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
  int ticker = 0;
  double stepValue;
  int newNumber = 0;
  int newNumber2 = 0;
  int _defaultValue = 0; //for timeSelector
  bool _ignore = false;
  TextEditingController _controllerText = TextEditingController();
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 400),
            (){
          setState(() {
            _animaName = 'greenlight';
          });
        }
    );

  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).taskBloc;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/tree1-2.jpg'))),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 30)),
            doListViewer(bloc),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              children: <Widget>[
                padder(),
                dayButton(bloc, "S"),
                dayButton1(bloc, "M"),
                dayButton2(bloc, "T"),
                dayButton3(bloc, "W"),
                dayButton4(bloc, "T"),
                dayButton5(bloc, "F"),
                dayButton6(bloc, "S"),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                ),
                box(5),
                box(15),
                box(30),
                box(45),
                box(60),
                Padding(
                  padding: EdgeInsets.only(left: 2.5),
                ),
                counter(),
              ],
            ),
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Center(
                  child: Stack(
                    children: <Widget>[
                      flareWriter(),
                      submit(bloc),
                    ],
                  ),
                ),
                Plane(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget submit(TaskBloc bloc) {
    return StreamBuilder(
        stream: bloc.description,
        builder: (context, snapshot) {
          return Positioned(
            left: 71.0,
            top: 42.0,
            child: Container(
              width: 110.0,
              height: 42.0,
              child: IgnorePointer(
                ignoring: _ignore,
                child: GestureDetector(
                  onTap: () async {
                    if (_animaName == null) {
                      onTap();
                    } else {
                      //return nothing
                    }
                    if(_animaName == 'greenlight')
                      {onTap();}else{}
                    if (snapshot.hasData) {
                      bloc.add(_selected, _selected1, _selected2, _selected3,
                          _selected4, _selected5, _selected6, newNumber);
                      setState(() {
                        _selected = false;
                        _selected1 = false;
                        _selected2 = false;
                        _selected3 = false;
                        _selected4 = false;
                        _selected5 = false;
                        _selected6 = false;
                      });
                    } else {}
                    newNumber = 0;
                    _defaultValue = 0;
                    setState(() {});
                  },
                ),
              ),
            ),
          );
        },
    );
  }

  Widget flareWriter() {
    return Container(
      height: 200,
      width: 250,
      child: Center(
        child: FlareActor(
          "assets/SubmitFolder5.flr",
          animation: _animaName,
        ),
      ),
    );
  }

  Widget planeAnimation() {
    return Container(
      height: 50,
      child: FlareActor(
        "assets/plane3.flr",
        animation: "plane",
        isPaused: planePaused,
      ),
    );
  }

  Widget flareStart() {
    return Container(
      height: 200,
      width: 250,
      child: Center(
        child: FlareActor(
          "assets/SubmitFolder5.flr",
          animation: "animation2",
          isPaused: false,
        ),
      ),
    );
  }

  onTap() async {
    setState(() {
      _ignore = true;
      _animaName = "animation2";
      _controllerText.clear();
    });
    await Future.delayed(Duration(seconds: 2),(){ setState(() {
      _animaName = null;
      _ignore = false;
    });});
  }

  Widget padder() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
    );
  }

  Widget dayButton(TaskBloc bloc, String day) {
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: _selected == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              _selected = !_selected;
            });
          },
        ),
      ),
    );
  }

  Widget dayButton1(TaskBloc bloc, String day) {
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: _selected1 == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () async {
            setState(() {
              _selected1 = !_selected1;
            });
          },
        ),
      ),
    );
  }

  Widget dayButton2(TaskBloc bloc, String day) {
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: _selected2 == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () async {
            setState(() {
              _selected2 = !_selected2;
            });
          },
        ),
      ),
    );
  }

  Widget dayButton3(TaskBloc bloc, String day) {
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: _selected3 == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () async {
            setState(() {
              _selected3 = !_selected3;
            });
          },
        ),
      ),
    );
  }

  Widget dayButton4(TaskBloc bloc, String day) {
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: _selected4 == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () async {
            setState(() {
              _selected4 = !_selected4;
            });
          },
        ),
      ),
    );
  }

  Widget dayButton5(TaskBloc bloc, String day) {
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: _selected5 == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () async {
            setState(() {
              _selected5 = !_selected5;
            });
          },
        ),
      ),
    );
  }

  Widget dayButton6(TaskBloc bloc, String day) {
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: _selected6 == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () async {
            setState(() {
              _selected6 = !_selected6;
            });
          },
        ),
      ),
    );
  }

  buttonHelper(String day, bool select) {
    bool localBool = select;
    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(
            day,
            style: TextStyle(fontSize: 20.0),
          ),
          color: localBool == false ? Colors.blue[100] : Colors.blue[400],
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              select = !select;
              print(localBool);
            });
          },
        ),
      ),
    );
  }

  Widget box(sDuration) {
    final int tick = sDuration;
    newNumber2 = sDuration;

    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      height: 50.0,
      width: 55.0,
      child: FlatButton(
          child: Text(
            "$sDuration",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          color: Colors.yellow[100],
          highlightColor: Colors.yellow[400],
          onPressed: () {
            setState(() {
              if (_animation == "animation") {
              } else
                _animation1 = "assets/checkmark.flr";
              _animation = "animation";
            });
            setState(() {
              ticker = _defaultValue + tick;
            });
            setState(() {
              _defaultValue = ticker;
              newNumber = _defaultValue;
            });
            if (ticker >= 60) {}
            print(newNumber); //TODO add this to a sink ->bloc
          }),
    );
  }

  Widget checkAnimation() {
    return Container(
      height: 50,
      child: FlareActor(
        _animation1,
        animation: _animation,
      ),
    );
  }

  Widget counter() {
    Duration timeDuration = new Duration(minutes: newNumber);

    return Container(
      decoration: BoxDecoration(color: Colors.white70),
      height: 50.0,
      width: 105.0,
      child: Center(
        child: Text(
          '${timeDuration.inHours}:${(timeDuration.inMinutes % 60).toString().padLeft(2, '0')}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }

  Widget doListViewer(TaskBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.description,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white70),
            height: 75.0,
            width: 380.0,
            child: Theme(
              data: ThemeData(
                  primaryColor: Colors.green, primaryColorDark: Colors.purple),
              child: TextField(
                controller: _controllerText,
                onChanged: bloc.addTask,
                maxLines: 2,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget title() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: Text(
        'New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
