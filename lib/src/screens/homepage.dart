import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
import 'package:more_bloc_testing/src/Animations/plane.dart';
export 'package:more_bloc_testing/main.dart';
import 'package:more_bloc_testing/src/screens/days/monday.dart';
import 'package:more_bloc_testing/src/screens/days/tuesday.dart';
import 'dart:async';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:more_bloc_testing/src/bloc/noteBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.indigo[200];

  final bloc = NoteBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/cork3.jpg'))),
        child: buildHomePage(context),
      ),
    );
  }

  Widget buildHomePage(context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 75),
          ),
          notes(),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          whiteBoard(),
        ],
      ),
    );
  }

  Widget notes() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: 'monday',
                child: DayNote(
                    day: '/monday',
                    test: MondayList(),
                    dayOf: 'assets/note2.png')),
            DayNote(dayOf: 'assets/noteTuesday.png'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DayNote(dayOf: 'assets/noteWed.png'),
            DayNote(dayOf: 'assets/noteThur.png'),
            DayNote(dayOf: 'assets/noteFri.png')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DayNote(dayOf: 'assets/noteSat.png'),
            DayNote(dayOf: 'assets/noteSun.png')
          ],
        ),
      ],
    );
  }

  Widget heroHelper(String tag, String day, Widget day1) {
    return Hero(
      tag: tag,
      child: DayNote(
        day: day,
        test: day1,
      ),
    );
  }

  Widget bottomBar() {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _color = Colors.pink;
              });

              Navigator.pushNamed(context, '/third');
            },
            child: Icon(
              Icons.add_circle,
              size: 70,
              color: _color,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Padding(padding: EdgeInsets.only(right: 10)),
          RaisedButton(
            child: Text('testnote'),
            onPressed: () {
              Navigator.pushNamed(context, '/fifth');
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Material(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white.withOpacity(.5),
            child: Container(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  _color = Colors.lightGreen;
                });
              },
              child: Icon(
                Icons.settings,
                size: 60,
                color: Colors.indigoAccent,
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget whiteBoard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[350],
          width: 8.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.8),
            offset: Offset.fromDirection(5.0, -6.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      height: 200,
      width: 370,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 5,
            bottom: 150,
            child: Text(
              'Quick Notes:',
              style: TextStyle(
                fontFamily: "Brownbag",
                fontSize: 40,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomBar(),
          ),
          Positioned(
            top: 29,
            left: 15,
            child: Container(
              height: 90,
              width: 325,
              child: noteViewer(bloc),
            ),
          ),
        ],
      ),
    );
  }

  Widget noteViewer(NoteBloc bloc) {
    return StreamBuilder<List<HomeScreenNote>>(
      stream: bloc.note,
        builder:(BuildContext context, AsyncSnapshot<List<HomeScreenNote>> snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              HomeScreenNote item = snapshot.data[index];
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  bloc.delete(item.id2);
                },
                child: ListTile(
                  leading: Text(item.id2.toString()),
                  title: Text(item.note),
              ),
              );
            }
          );
        } else{
          return Center(child: Text('not working'),);
        }

      }
    );
  }
}
