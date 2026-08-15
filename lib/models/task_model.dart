
class TaskModel {
  String id;
  String title;
  bool isDone;
  TaskModel(this.id, this.title, this.isDone);
  String get getTitle => title;
  String get getId => id;
  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "isDone": isDone};
  }

  static TaskModel fromJson(Map json) {
   return TaskModel(json["id"].toString(),
     json["title"].toString(),
      json["isDone"]as bool);
  }
}
