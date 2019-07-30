import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/screens/clock_test.dart';
import 'package:more_bloc_testing/src/resources/quote_generator.dart';
import 'package:more_bloc_testing/src/resources/stickynote.dart';
import 'package:more_bloc_testing/src/bloc/colorBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FridayList extends StatefulWidget {
  final String heroDay;

  FridayList({this.heroDay});

  final String color = 'color5';

  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<FridayList> {
  Color _thisColor;

  @override
  void initState() {
    super.initState();
    _getColor1();

  }
  Future<void>_getColor1() async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt(widget.color); // note color
    setState(() {
      _thisColor = Color(color1);
    });
  }

  bool _isChecked = false;
  int total = 0;

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  final bloc = FridayBloc();
  final colorBloc = ColorBloc();
  Stream stream;

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/whiteboard.png'))),
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      viewerTest(bloc),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 25,
              top: 25,
              child: IgnorePointer(
                child: StickyNote(
                  text: 'FRI',
                  noteColor: _thisColor,

                ),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 31,
              child: Container(
                height: 30,
                width: 350,
                child: DigitalClock(),
              ),
            ),
            Positioned(
              bottom: 24,
              right: 15,
              child: Icon(Icons.info,size: 20,),),
            Positioned(
              top: 20,
              left: 140,
              child: QuoteBuddy(),
            ),
            Positioned(
              top: 145,
              child: Container(
                height: 20,
                width: 411,
                child: ListTile(
                  leading: Text(
                    '     #',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                  ),
                  title: Text(
                    'Task       ',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                  ),
                  trailing: Text(
                    'Time',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewerTest(FridayBloc bloc) {
    return StreamBuilder<List<ListModel>>(
      stream: bloc.tasks,
      builder: (BuildContext context, AsyncSnapshot<List<ListModel>> snapshot) {
        if (snapshot.hasData) {

          return Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.transparent)),
                height: 130, //padding above list
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.transparent)),
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 40),
                child: Container(
                  height: 375,
                  width: 375,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                      height: 5.0,
                      color: Colors.grey[200],
                    ),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      ListModel item = snapshot.data[index];
                      int _ind = index + 1;
                      Widget iscompleted;

                      Duration timeDuration =
                      new Duration(minutes: item.duration);
                      if (item.completed == true) {
                        iscompleted = Container(
                          height: 25,
                          width: 25,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        iscompleted = Container(
                          height: 25,
                          width: 25,
                        );
                      }

                      return Dismissible(
                        key: UniqueKey(),
                        secondaryBackground: remove(),
                        background: completed(),
                        onDismissed: (direction) {
                          bloc.delete(item.id);
                        },
                        child: ListTile(
                          onLongPress: () {
                            bloc.update2(item);
                          },
                          contentPadding: EdgeInsets.only(left: 0),
                          title: Text(
                            item.description,
                            style: TextStyle(fontSize: 20),
                          ),
                          leading: Container(
                            height: 40,
                            width: 40,
                            child: GestureDetector(
                              onTap: () {
                                bloc.complete(item);
                              },
                              child: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      child: Text(
                                        '$_ind',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      padding: EdgeInsets.only(left: 0),
                                    ),
                                  ),
                                  Positioned(
                                    child: iscompleted,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          trailing: Text(
                            '${timeDuration.inHours}:${(timeDuration.inMinutes % 60).toString().padLeft(2,'0')}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 4,
                width: 374,
                color: Colors.grey.withOpacity(.5),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 293,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  Container(
                    height: 30,
                    width: 55,
                    child: totals(bloc),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              )
            ],
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 300),
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget completed() {
    return Container(
      color: Colors.green[200],
      child: Text(
        'COMPLETED',
        style: TextStyle(
            fontSize: 50.0, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget remove() {
    return Container(
      color: Colors.red[200],
      child: Text(
        'DELETED',
        style: TextStyle(
            fontSize: 50.0, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget progress(String str) {
    return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: Colors.lightGreen),
      child: Container(
        child: Row(
          children: <Widget>[
            Text('Progress Indicator WIP'),
            Padding(
              padding: EdgeInsets.only(right: 20),
            ),
            Text(
              str,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget progressBar(double val) {
    return Container(
      height: 30,
      width: 293,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: Colors.lightGreen),
      child: LinearProgressIndicator(
        backgroundColor: Colors.blueGrey[100],
        value: val,
      ),
    );
  }

  onChecked() {
    if (_isChecked == false) {
      _isChecked = !_isChecked;
    }
    if (_isChecked == true) {
      _isChecked = !_isChecked;
    }
  }

  totals(FridayBloc bloc) {
    bloc.totalTime();

    return StreamBuilder(
      stream: bloc.sum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Duration totalDuration = new Duration(minutes: snapshot.data);
          return Container(
              child: Text(
                '${totalDuration.inHours.toInt()}:${(totalDuration.inMinutes.toInt() % 60).toString().padLeft(2,'0')}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20.0),
              ));
        } else {
          return Container(
            child: Text(
              '0',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 20),
            ),
          );
        }
      },
    );
  }
}