import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../resources/list_model.dart';
import '../resources/list_db.dart';

class ListBloc {


  final _clientController = StreamController<List<ListModel>>.broadcast();
  final _name = BehaviorSubject<String>();

  Stream<String> get name => _name.stream;
  get clients => _clientController.stream;

  Function(String)get changeName => _name.sink.add;

  dispose() {
    _clientController.close();
    _name.close();
  }

}
