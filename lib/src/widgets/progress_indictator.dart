import 'package:flutter/material.dart';

class ProgressIndicator extends StatefulWidget {
  ProgressIndicator({Key key,this.title}) : super(key: key);

  final String title;

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 300,
      color: Colors.green[150],
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green[450],
            width: 5,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blueGrey[200],
              offset: Offset(3.0, 6.0),
              blurRadius: 20.0,
              spreadRadius: 30.0
            )
          ]),
    );
  }
}
