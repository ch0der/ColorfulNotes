import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';

//TODO look at newsapi and use his bloc setup instead of this garbage

class ListViewer extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  final bloc = TaskBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello"),),
      body: viewerTest(bloc),
    );
  }
  Widget viewerTest(TaskBloc bloc){
    return StreamBuilder<List<ListModel>>(
      stream: bloc.tasks,
      builder: (BuildContext context, AsyncSnapshot<List<ListModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              ListModel item = snapshot.data[index];
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (direction){
                  bloc.delete(item.id);
                },
                child: ListTile(
                  title: Text(item.description),
                  leading: Text(item.id.toString()),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
