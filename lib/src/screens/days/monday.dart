import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/screens/clock_test.dart';
import 'package:more_bloc_testing/src/resources/quote_generator.dart';


//TODO look at newsapi and use his bloc setup instead of this garbage

class MondayList extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<MondayList> {
  bool _isChecked = false;

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  final bloc = TaskBloc();
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
                  delegate: SliverChildListDelegate([
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
                  child: Hero(
                      tag: 'monday',
                      child: DayNote(
                        dayOf: 'assets/note2.png',
                      )),
                )),
            Positioned(
              bottom: 22,
              left: 20,
              child: Container(
                height: 25,
                child: FittedBox(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    child: DigitalClock()),
              ),
            ),
            Positioned(
              top: 20,
              left: 140,
              child: QuoteBuddy(),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewerTest(TaskBloc bloc) {
    return StreamBuilder<List<ListModel>>(
      stream: bloc.tasks,
      builder: (BuildContext context, AsyncSnapshot<List<ListModel>> snapshot) {
        if (snapshot.hasData) {
          double testnum;
          if (snapshot.data.length != null) {
            testnum = snapshot.data.length + 1.toDouble();
          } else {
            testnum = 0;
          }

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
                padding: EdgeInsets.only(left: 5),
                child: Container(
                  height: 380,
                  width: 375,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                          height: 5.0,
                          color: Colors.grey[200],
                        ),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      ListModel item = snapshot.data[index];
                      int _ind = index + 1;
                      Widget iscompleted;

                      Duration timeDuration = new Duration(minutes: item.duration);
                      if (item.completed == true) {
                        iscompleted = Container(height: 25,width: 25,child: Icon(Icons.check_circle,color: Colors.green,),);
                      } else {
                        iscompleted = Container(height: 25,width: 25,);
                      }

                      return Dismissible(
                        key: UniqueKey(),
                        secondaryBackground: remove(),
                        background: completed(),
                        onDismissed: (direction) {
                          bloc.delete(item.id);
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 0),
                          title: Text(
                            item.description,
                            style: TextStyle(fontSize: 20),
                          ),
                          leading: Container(height: 40,width: 40,
                            child: GestureDetector(
                              onTap: (){
                                bloc.complete(item);
                              },
                              child: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      child: Text(
                                        '$_ind',
                                        style: TextStyle(fontSize: 20,),
                                      ), padding: EdgeInsets.only(left: 20),
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
                            '${timeDuration.inHours}:${timeDuration.inMinutes % 60}',
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
                  progressBar(1 / testnum),
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
              height: 25,
              width: 36,
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
          Padding(padding: EdgeInsets.only(right: 20)),
          Text(
            str,
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
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

  totals(TaskBloc bloc) {
    bloc.totalTime();
    return StreamBuilder(
        stream: bloc.sum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                child: Text(
              snapshot.data,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 20.0),
            ));
          } else {
            return Container(
              child: Text('no data'),
            );
          }
        });
  }
}
