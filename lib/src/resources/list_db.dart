import 'dart:async';
import 'dart:io';
import 'list_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async{
    if(_database != null)
      return _database;
     _database = await initDB();
    return _database;
  }

  initDB()async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB1.db");
    return await openDatabase(path,version: 1,onOpen: (db){},
        onCreate: (Database db, int version)async{
          await db.execute("CREATE TABLE ListModel ("
              "id INTEGER PRIMARY KEY,"
              "task TEXT"
              "duration INTEGER"
              "completed BIT"
              "sunday BIT"
              "monday BIT"
              "tuesday BIT"
              "wednesday BIT"
              "thursday BIT"
              "friday BIT"
              "saturday BIT"
              ")");
        });
  }

  newItem(ListModel newItem) async{
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM ListModel");
    int id = table.first["id"];
    var raw = await db.rawInsert("INSERT into ListModel(id,task,duration,completed)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?)",
      [id, newItem.task, newItem.duration, newItem.completed,
      newItem.sunday,newItem.monday,newItem.tuesday,newItem.wednesday,newItem.thursday,newItem.friday, newItem.saturday]);
    return raw;
  }

  Future<List<ListModel>> getTasks() async{
    final db = await database;
    var res = await db.query("task");
    List<ListModel> list = res.isNotEmpty ? res.map((f)=> ListModel.fromMap(f)).toList() : [];
    return list;
  }


}