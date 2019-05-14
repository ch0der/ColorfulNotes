import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/Animations/homepage_helper.dart';


class TuesdayList extends StatefulWidget {
  @override
  _TuesdayListState createState() => _TuesdayListState();
}

class _TuesdayListState extends State<TuesdayList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/cork3.jpg'))),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 20,top: 20,
                  child: Hero(
                      tag: 'monday2',
                      child: DayNote(dayOf:'assets/noteTuesday.png'))),

            ],
          ),
        )
    );
  }
}

