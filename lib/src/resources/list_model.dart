// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

import 'dart:convert';

ListModel listModelFromJson(String str) {
  final jsonData = json.decode(str);
  return ListModel.fromJson(jsonData);
}

String listModelToJson(ListModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ListModel {
  int id;
  String task;
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
    this.task,
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

  factory ListModel.fromJson(Map<String, dynamic> json) => new ListModel(
    id: json["id"],
    task: json["task"],
    duration: json["duration"],
    completed: json["completed"],
    sunday: json["sunday"],
    monday: json["monday"],
    tuesday: json["tuesday"],
    wednesday: json["wednesday"],
    thursday: json["thursday"],
    friday: json["friday"],
    saturday: json["saturday"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task": task,
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