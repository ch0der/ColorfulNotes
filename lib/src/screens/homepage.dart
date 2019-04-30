import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';
import 'package:more_bloc_testing/src/Animations/plane.dart';
export 'package:more_bloc_testing/main.dart';
import 'package:more_bloc_testing/src/screens/days/monday.dart';
import 'package:more_bloc_testing/src/screens/days/tuesday.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: buildHomePage(context),
      ),
    );
  }

  Widget buildHomePage(context){
    return Container(
      decoration: BoxDecoration(image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/cork3.jpg'))),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 50.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/third'); //list builder
                }
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context,'/fourth');
                },
              ),
              RaisedButton(
                child: Text('sunday'),
                onPressed: (){
                  Navigator.pushNamed(context,'/fifth');
                },
              ),
            ],
          ),
         notes(),
          Container(
            height: 115,
            width: 300,
            child: RaisedButton(onPressed: null),
          )
        ],
      ),
    );
  }
  Widget notes(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'monday',
                child: DayNote(day: '/monday',test: MondayList(),)),
            DayNote(),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DayNote(),
            DayNote(),
            DayNote()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DayNote(),
            heroHelper('monday2', 'tuesday', TuesdayList(),),

          ],
        ),
      ],
    );
  }
  Widget heroHelper(String tag, String day, Widget day1){
    return Hero(
      tag: tag,
      child: DayNote(day: day,test: day1,),
    );
  }
}