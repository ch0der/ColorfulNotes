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

  ListModel({
    this.id,
    this.task,
    this.duration,
    this.completed,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => new ListModel(
    id: json["id"],
    task: json["task"],
    duration: json["duration"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task": task,
    "duration": duration,
    "completed": completed,
  };
}