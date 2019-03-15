import 'package:flutter/material.dart';
import '../widgets/todo_day.dart';
import 'package:flutter/rendering.dart';
import '../Animations/todo_list_builder_animations/writing.dart';

class BuildList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          title(),
          doListViewer(),
          daySelect(),

        ],
      ),
    );
  }
  Widget title(){
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 5),
      child: Text('New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),

      ),
    );
  }

  Widget doListViewer(){
    return Container(
      height: 75.0,
      width: 350.0,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.green,
          primaryColorDark: Colors.purple
        ),
        child: TextField(
          maxLines: 2,
          textAlign: TextAlign.center,
          decoration: InputDecoration(

            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),

            ),
          ),


        ),
      ),
    );
  }

  Widget daySelect(){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: Text('Day',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),),
        ),
        Row(
          children: <Widget>[Padding(padding: EdgeInsets.only(left: 14.0),),
            HelperTile(day: 'S'), HelperTile(day: 'M'), HelperTile(day: 'T'), HelperTile(day: 'W'),
            HelperTile(day: 'T'), HelperTile(day: 'F'), HelperTile(day: 'S'),
          ],
        ), //../widgets/todo_day
        Padding(padding: EdgeInsets.only(top: 20.0)),
        Text('Duration',textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
        Row(
          children: <Widget>[Padding(padding: EdgeInsets.only(left: 50.0),),
          TimeHelperTile(sDuration: '5',duration: 5.0,), TimeHelperTile(sDuration: '15',duration: 15.0,), TimeHelperTile(sDuration: '30',duration: 30.0,),
          TimeHelperTile(sDuration: '45',duration: 45.0,), TimeHelperTile(sDuration: '60',duration: 60.0,),
          ],
        ),
        FlareWriter()

      ],

    );
  }

}
