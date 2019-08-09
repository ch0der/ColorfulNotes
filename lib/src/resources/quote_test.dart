import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Quoter extends StatefulWidget {
  @override
  _QuoterState createState() {
    return _QuoterState();
  }
}

class _QuoterState extends State<Quoter> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Quotes').where('#',isEqualTo: rndNum).limit(1).snapshots(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Container();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Column(
      key: ValueKey(record.text),
      children: <Widget>[
          Text(record.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,),
        Padding(padding: EdgeInsets.only(top: 5),),
        Text(record.author,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,),
      ],
    );
  }
  var rndNum = math.Random().nextInt(30);
}

class Record {
  final String text;
  final String author;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['text'] != null),
        assert(map['author'] != null),
        text = map['text'],
        author = map['author'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$text:$author>";
}