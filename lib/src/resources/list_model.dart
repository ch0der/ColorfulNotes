// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

import 'dart:convert';

ListModel listModelFromJson(String str) {
  final jsonData = json.decode(str);
  return ListModel.fromMap(jsonData);
}

String listModelToJson(ListModel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class ListModel {
  int id;
  String description;
  int duration;
  bool completed;
  bool sunday;
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;

  ListModel({
    this.id,
    this.description,
    this.duration,
    this.completed,
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  factory ListModel.fromMap(Map<String, dynamic> json) => new ListModel(
    id: json["id"],
    description: json["description"],
    duration: json["duration"],
    completed: json["completed"] == 1,
    sunday: json["sunday"] == 1,
    monday: json["monday"] == 1,
    tuesday: json["tuesday"] == 1,
    wednesday: json["wednesday"] == 1,
    thursday: json["thursday"] == 1,
    friday: json["friday"] == 1,
    saturday: json["saturday"] == 1,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "description": description,
    "duration": duration,
    "completed": completed,
    "sunday": sunday,
    "monday": monday,
    "tuesday": tuesday,
    "wednesday": wednesday,
    "thursday": thursday,
    "friday": friday,
    "saturday": saturday,
  };
}

HomeScreenNote homeScreenNoteFromJson(String str){
  final jsonData = json.decode(str);
  return HomeScreenNote.fromMap(jsonData);
}

String homeScreenNoteToJson(HomeScreenNote data){
  final dyn = data.toMap();
  return json.encode(dyn);
}

class HomeScreenNote {
  int id2;
  String note;

  HomeScreenNote({
    this.id2,
    this.note,
  });

  factory HomeScreenNote.fromMap(Map<String, dynamic> json) => new HomeScreenNote(
    id2: json["id2"],
    note: json["note"],
  );

  Map<String, dynamic> toMap() => {
    "id2": id2,
    "note": note,
  };
}
NoteColors colorsFromJson(String str){
  final jsonData = json.decode(str);
  return NoteColors.fromMap(jsonData);
}

String noteColorsToJson(NoteColors data){
  final dyn = data.toMap();
  return json.encode(dyn);
}

class NoteColors {
  int id3;
  String color;

  NoteColors({
    this.id3,
    this.color,
  });

  factory NoteColors.fromMap(Map<String, dynamic> json) => new NoteColors(
    id3: json["id3"],
    color: json["color"],
  );

  Map<String, dynamic> toMap() => {
    "id3": id3,
    "color": color,
  };
}
