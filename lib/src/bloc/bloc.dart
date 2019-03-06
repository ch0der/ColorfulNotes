import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../resources/list_model.dart';
import '../resources/list_db.dart';

class ClientsBloc {


  final _clientController = StreamController<List<ListModel>>.broadcast();
  final _name = BehaviorSubject<String>();

  Stream<String> get name => _name.stream;
  get clients => _clientController.stream;

  Function(String)get changeName => _name.sink.add;

  dispose() {
    _clientController.close();
    _name.close();
  }

  getClients() async {
    _clientController.sink.add(await DBProvider.db.getAllClients());
  }

  ClientsBloc() {
    getClients();
  }

  blockUnblock(Client client) {
    DBProvider.db.blockOrUnblock(client);
    getClients();
  }

  delete(int id) {
    DBProvider.db.deleteClient(id);
    getClients();
  }

  add(Client client) {

    DBProvider.db.newClient(client);
    getClients();
  }

  submit(){

    final firstName = _name.value;
    print('name is $firstName');

  }
  add2(){

    final firstName = _name.value;

    Client client =
    Client( firstName: firstName, lastName: "asdasdas", blocked: false);

    DBProvider.db.newClient(client);
    print('$firstName');
    getClients();
  }
}
