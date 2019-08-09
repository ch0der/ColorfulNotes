import 'package:flutter/material.dart';
import '../bloc/provider.dart';
import '../bloc/noteBloc.dart';
import 'dart:async';

class NoteAdder extends StatefulWidget {
  @override
  _NoteAdderState createState() => _NoteAdderState();
}
TextEditingController _controller = TextEditingController(text: 'test');
String noteText;

class _NoteAdderState extends State<NoteAdder> {
  @override
  Widget build(BuildContext context) {
    final noteBloc = Provider.of(context).noteBloc;

    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50)),
            addText(noteBloc),
            Padding(padding: EdgeInsets.only(top: 15)),
            submit(noteBloc),
          ],
        ),
      ),
    );
  }

  Widget addText(NoteBloc noteBloc) {
    return StreamBuilder<Object>(
        stream: noteBloc.description,
        builder: (context, snapshot) {
          return Stack(
            children: [
              whiteBoard(),
              Positioned(
                left: 25,
                top: 40,
                child: Container(
                  width: 330,
                  height: 130,
                  child: TextField(
                    autofocus: true,
                    onChanged: noteBloc.addNote,
                    maxLines: 4,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget submit(NoteBloc noteBloc) {
    return StreamBuilder(
        stream: noteBloc.description,
        builder: (context, snapshot) {
          return Container(
            width: 90,
            height: 50,
            child: RaisedButton(
                color: Colors.green[200],
                elevation: 5,
                shape: CircleBorder(),
                child: Icon(
                  Icons.done,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () async {
                  String str = snapshot.data;
                  noteBloc.add(str);
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.pop(context);
                  });
                }),
          );
        });
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
      height: 180,
      width: 370,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 5,
            bottom: 130,
            child: Text(
              'Notes:',
              style: TextStyle(
                fontFamily: "Brownbag",
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
