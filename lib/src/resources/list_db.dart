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
    String path = join(documentsDirectory.path, "newDB2.db");
    return await openDatabase(path,version: 1,onOpen: (db){},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE ListModel ("
              "id INTEGER PRIMARY KEY,"
              "description TEXT,"
              "duration INTEGER,"
              "completed BIT,"
              "sunday BIT,"
              "monday BIT,"
              "tuesday BIT,"
              "wednesday BIT,"
              "thursday BIT,"
              "friday BIT,"
              "saturday BIT"
              ")");

          await db.execute("CREATE TABLE HomeScreenNote ("
              "id2 INTEGER PRIMARY KEY AUTOINCREMENT,"
              "note TEXT"
              ")");

          await db.execute("CREATE TABLE Colors ("
              "id3 INTEGER PRIMARY KEY,"
              "color TEXT NOT NULL"
              ")");


        });

  }

  newItem(ListModel newItem) async{
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM ListModel");
    int id = table.first["id"];
    var raw = await db.rawInsert("INSERT into ListModel (id,description,duration,completed,sunday,monday,tuesday,wednesday,thursday,friday,saturday)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?)",
      [id, newItem.description, newItem.duration, newItem.completed,
      newItem.sunday,newItem.monday,newItem.tuesday,newItem.wednesday,newItem.thursday,newItem.friday, newItem.saturday]);
    return raw;
  }

  Future<List<ListModel>> getAllTasks() async {
    final db = await database;
    var res = await db.query("ListModel");
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }

    Future<List<String>> getDescriptions() async {
      final db = await database;
      var res = await db.query("description");
      List<String> list = res.isNotEmpty ? res.map((c) =>
          ListModel.fromMap(c)).toList() : [];
      return list;
    }

    getListModel(int id) async{
      final db = await database;
      var res = await db.query("ListModel",where: "id = ?",whereArgs: [id]);
      return res.isNotEmpty ? ListModel.fromMap(res.first) : null;
    }
    deleteTask(int id)async{
      final db = await database;
      return db.delete("ListModel", where: "id = ?", whereArgs: [id]);

    }
    Future<List<ListModel>> getSunday() async{
    final db = await database;
    var res = await db.query("ListModel",where: "sunday = ?",whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c)=> ListModel.fromMap(c)).toList() : [];
    return list;

    }
  Future <int> calculateTotal() async {
    var db = await database;
    var result = await db.rawQuery("SELECT SUM(duration) FROM $ListModel");
    int value = result[0]["SUM(duration)"];
    if(result.length > 0){
      return value.toInt();
    } else {return null;}
  }

  Future <int> calculateTotal2(String str1) async {
    List<String> str = ['1'];
    String test = str1;
    var db = await database;
    var result = await db.rawQuery("SELECT SUM(duration) FROM $ListModel WHERE $test = ? ",str);
    if(result.length > 0){
      int value = result[0]["SUM(duration)"];
      return value;
    } else {return 0;}

  }
  deleteADay(String day1)async{
    String day = day1;
    final db = await database;
    db.delete("ListModel",where: "$day = ?", whereArgs: [1]);
  }
  deleteADay2(String day1)async{
    String day = day1;
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET $day = ?',[0]);
    return res;

  }
  complete(ListModel item)async{
    final db = await database;
    ListModel completed = ListModel(
      id: item.id,
      description: item.description,
      duration: item.duration,
      completed: !item.completed,
      sunday: item.sunday,
      monday: item.monday,
      tuesday: item.tuesday,
      wednesday: item.wednesday,
      thursday: item.thursday,
      friday: item.friday,
      saturday: item.saturday);
    var res = await db.update("ListModel", completed.toMap(),
    where: "id = ?", whereArgs: [item.id]);
    return res;
  }
  Future <List<ListModel>> monday() async{
    final db = await database;
    var res = await db.query("ListModel", where: "monday = ?", whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }
  Future <List<ListModel>> tuesday() async{
    final db = await database;
    var res = await db.query("ListModel", where: "tuesday = ?", whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }
  Future <List<ListModel>> wednesday() async{
    final db = await database;
    var res = await db.query("ListModel", where: "wednesday = ?", whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }
  Future <List<ListModel>> thursday() async{
    final db = await database;
    var res = await db.query("ListModel", where: "thursday = ?", whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }
  Future <List<ListModel>> friday() async{
    final db = await database;
    var res = await db.query("ListModel", where: "friday = ?", whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }
  Future <List<ListModel>> saturday() async{
    final db = await database;
    var res = await db.query("ListModel", where: "saturday = ?", whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }
  Future <List<ListModel>> sunday() async{
    final db = await database;
    var res = await db.query("ListModel", where: "sunday = ?", whereArgs: [1]);
    List<ListModel> list =
    res.isNotEmpty ? res.map((c) => ListModel.fromMap(c)).toList() : [];
    return list;
  }
  delete1(ListModel item)async{
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET monday = ${item.monday} WHERE id = ${item.id}');
    return res;
  }

  delete2(ListModel item)async{
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET tuesday = ${item.wednesday} WHERE id = ${item.id}');
    return res;
  }
  delete3(ListModel item)async{
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET wednesday = ${item.wednesday} WHERE id = ${item.id}');
    return res;
  }
  delete4(ListModel item)async{
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET thursday = ${item.thursday} WHERE id = ${item.id}');
    return res;
  }
  delete5(ListModel item)async{
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET friday = ${item.friday} WHERE id = ${item.id}');
    return res;
  }
  delete6(ListModel item)async{
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET saturday = ${item.saturday} WHERE id = ${item.id}');
    return res;
  }
  delete7(ListModel item)async{
    final db = await database;
    var res = await db.rawUpdate('UPDATE ListModel SET sunday = ${item.sunday} WHERE id = ${item.id}');
    return res;
  }



  deleteTest2(ListModel item)async{
    final db = await database;
    var res = await db.update("ListModel", item.toMap(), where: "id = ?", whereArgs: [item.id]);
    return res;
  }
  deleteALL()async{
    final db = await database;
    var res = await db.delete('ListModel');
    return res;
  }




    // homescreen db

  newNote(HomeScreenNote newNote) async{
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id2)+1 as id2 FROM HomeScreenNote");
    int id2 = table.first["id2"];
    var raw = await db.rawInsert("INSERT into HomeScreenNote (id2,note)"
        " VALUES (?,?)",
        [id2, newNote.note]);
    return raw;

  }
  deleteNote(int id2)async {
    final db = await database;
    return db.delete("HomeScreenNote", where: "id2 = ?", whereArgs: [id2]);
  }

  Future<List<HomeScreenNote>> getNote() async {
    final db = await database;
    var res = await db.query("HomeScreenNote");
    List<HomeScreenNote> list =
    res.isNotEmpty ? res.map((a) => HomeScreenNote.fromMap(a)).toList() : [];
    return list;
  }

  getTheNote(int id2) async {
    final db = await database;
    var res = await db.query("HomeScreenNote", where: "id2 = ?", whereArgs: [id2]);
    return res.isNotEmpty ? HomeScreenNote.fromMap(res.first) : null;
  }
  updateNote(HomeScreenNote newNote) async {
    final db = await database;
    var res = await db.update("HomeScreenNote", newNote.toMap(),
        where: "id2 = ?", whereArgs: [newNote.id2]);
    return res;
  }
  nuke()async{
    final db = await database;
    return db.delete("HomeScreenNote");

  }

  //colors


  Future newNoteColor(NoteColors newNoteColor) async{
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id3)+1 as id3 FROM Colors");
    int id3 = table.first["id3"];
    var raw = await db.rawInsert("INSERT into Colors (id3,color)"
        " VALUES (?,?)",
        [id3, newNoteColor.color]);
    return raw;

  }

  Future getAcolor<String>(int id3)async{
    final db = await database;
    var res = await db.rawQuery("SELECT color FROM Colors WHERE id3 = $id3");
    return res.isNotEmpty ? res : null;
  }
  Future<NoteColors> getColors() async {
    final db = await database;
    var res = await db.query("Colors");
    NoteColors list =
    res.isNotEmpty ? res.map((a) => NoteColors.fromMap(a)) : [];
    return list;
  }
  getoneColor(int id3) async {
    final db = await database;
    var res = await db.query("Colors", where: "id3 = ?", whereArgs: [id3]);
    return res.isNotEmpty ? NoteColors.fromMap(res.first) : null;
  }
}


