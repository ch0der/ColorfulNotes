import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Animations/todo_list_builder_animations/writing.dart';
import '../bloc/provider.dart';
import '../bloc/taskBloc.dart';



class BuildList extends StatefulWidget{

  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final taskBloc = Provider.of(context).taskBloc;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage('assets/tree1-2.jpg'))),
        child: Column(
          children: <Widget>[
            title(),
            doListViewer(taskBloc),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            FlareWriter(),

          ],
        ),
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

  Widget doListViewer(TaskBloc taskBloc){
    return StreamBuilder<Object>(
      stream: taskBloc.description,
      builder: (context, snapshot) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white70),
          height: 75.0,
          width: 350.0,
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.green,
              primaryColorDark: Colors.purple
            ),
            child: TextField(
              onChanged: taskBloc.addTask,
              maxLines: 2,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.white,

                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),

                ),
              ),


            ),
          ),
        );
      }
    );
  }
}
