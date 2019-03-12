import 'package:flutter/material.dart';

class DaySelector extends StatefulWidget {
  @override
  _DaySelectorState createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class HelperTile extends StatefulWidget {
  final String day;

  HelperTile({Key key, this.day}) :super(key:key);

  @override
  _HelperTileState createState() => _HelperTileState();
}

class _HelperTileState extends State<HelperTile> {
   bool _selected = false;



  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 2.5, right: 2.5),
      child: ButtonTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0),
            topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0))),
        minWidth: 50.0,
        height: 50.0,
        child: FlatButton(
          child: Text(widget.day,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          color: _selected == false? Colors.blue[100] : Colors.blue[400],
          highlightColor: null ,
          onPressed: (){
            setState(() {
              _selected = !_selected;
            });
          },

        ),
      ),
    );
  }
}


