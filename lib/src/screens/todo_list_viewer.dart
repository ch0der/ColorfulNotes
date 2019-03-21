import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/bloc/taskBloc.dart';
import 'package:more_bloc_testing/src/bloc/provider.dart';
import 'package:more_bloc_testing/src/bloc/masterBloc.dart';


class ListViewer extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  @override
  Widget build(BuildContext context) {
    final taskBloc = Provider.of(context).taskBloc;
    return Scaffold(
      body: Column(
        children: <Widget>[
          viewerTest(taskBloc),
        ],
      ),

    );
  }

  Widget viewerTest(TaskBloc taskBloc){
    return StreamBuilder<List<ListModel>>(
      stream: bloc.clients,
      builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Client item = snapshot.data[index];
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  bloc.delete(item.id);
                },
                child: ListTile(
                  title: Text(item.firstName),
                  leading: Text(item.id.toString()),
                  trailing: Checkbox(
                    onChanged: (bool value) {
                      bloc.blockUnblock(item);
                    },
                    value: item.blocked,
                  ),
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
