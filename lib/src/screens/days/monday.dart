import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:more_bloc_testing/src/screens/clock_test.dart';
import 'package:more_bloc_testing/src/Animations/checkmark.dart';

//TODO look at newsapi and use his bloc setup instead of this garbage

class MondayList extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<MondayList> {
  String _animation;
  String _route;
  String _time;
  bool _isPaused = false;

  final bloc = TaskBloc();

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
                  ]),
                ),
              ],
            ),
            Positioned(left: 8,top: 5,child: Hero(tag: 'monday', child: DayNote())),
            Positioned(
              bottom: 22,
              left: 20,
              child: Container(
                  height: 25,
                  child: FittedBox(fit: BoxFit.cover, alignment: Alignment.center ,child: MyHomePage()),),
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
          return Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.greenAccent)),
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(left: 22),
                child: Container(
                  height: 500,
                  width: 350,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                          height: 1.0,
                          color: Colors.blue,
                        ),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      ListModel item = snapshot.data[index];
                      return Dismissible(
                        key: UniqueKey(),
                        secondaryBackground: remove(),
                        background: completed(),
                        onDismissed: (direction) {
                          bloc.delete(item.id);
                        },
                        child: ListTile(
                          onLongPress: () {
                            setState(() {
                              _route = "assets/checkmark2.flr";
                              _animation = "animation";
                            });
                          },
                          title: Text(item.description),
                          leading: Checkmark(
                            route: _route,
                            animation: _animation,
                          ),
                          trailing: Text('${item.duration}'),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 2,
                color: Colors.green,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
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

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _time = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('EEEE MMMM d y, h:m:ss a').format(dateTime);
  }
}