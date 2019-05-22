import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'clock_test.dart';
import 'package:more_bloc_testing/src/Animations/checkmark.dart';

//TODO look at newsapi and use his bloc setup instead of this garbage

class ListViewer extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  String _animation;
  String _route;
  String _time;
  bool _isPaused = false;
  bool _isChecked = false;

  final bloc = TaskBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        color: Colors.orange,
      ),
      appBar: AppBar(
        title: DigitalClock(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              viewerTest(bloc),
            ]),
          ),
        ],
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
                height: 29,
                color: Colors.orange,
              ),
              ListView.builder(
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
              Container(
                height: 29,
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
    return DateFormat('EEEE MMMM d y, h:m:s a').format(dateTime);
  }
}
