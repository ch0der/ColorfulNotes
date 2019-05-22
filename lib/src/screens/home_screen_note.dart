import 'package:flutter/material.dart';
import 'dart:async';
import '../bloc/provider.dart';
import '../bloc/noteBloc.dart';

class NoteAdder extends StatefulWidget {
  @override
  _NoteAdderState createState() => _NoteAdderState();
}

class _NoteAdderState extends State<NoteAdder> {
  @override
  Widget build(BuildContext context) {
    final noteBloc = Provider.of(context).noteBloc;

    return Scaffold(
      body: Column(
        children: <Widget>[
          addText(noteBloc),
          submit(noteBloc),
        ],
      ),
    );
  }

  Widget addText(NoteBloc noteBloc) {
    return StreamBuilder<Object>(
        stream: noteBloc.description,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white70),
            height: 75.0,
            width: 350.0,
            child: Theme(
              data: ThemeData(
                  primaryColor: Colors.green, primaryColorDark: Colors.purple),
              child: TextField(
                onChanged: noteBloc.addNote,
                maxLines: 4,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget submit(NoteBloc noteBloc) {
    return StreamBuilder(
        stream: noteBloc.description,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed:()async{
              String str = snapshot.data;
              noteBloc.add(str);
            }
          );
        }
        );
  }
}
