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
    return RaisedButton(
      onPressed: (){
        Navigator.pushNamed(context, '/third');
      }
    );
  }
  

}