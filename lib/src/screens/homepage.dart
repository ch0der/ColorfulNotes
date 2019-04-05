import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: buildHomePage(context),
      ),
      appBar: AppBar(
        title: Text('test'),
      ),
    );
  }
  
  Widget buildHomePage(context){
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/third');
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
        )
      ],
    );
  }
  

}