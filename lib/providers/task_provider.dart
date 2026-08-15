import 'package:flutter/material.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:to_do_list/services/pref_helpper.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _task = [];
  List<TaskModel> get tasks => _task;

  TaskProvider() {
    getTask();
  }
  void addTask(String title) {
    TaskModel newTask = TaskModel(
      DateTime.now().microsecondsSinceEpoch.toString(),
      title,
      false,
    );
    _task.add(newTask);
    notifyListeners();
    saveTask();
  }

  void editTask(String id, String title) {
    TaskModel editedTask = _task.firstWhere((task) => task.getId == id);
    editedTask.title = title;
    notifyListeners();
    saveTask();
  }

  void deleteTask(String id) {
    _task.removeWhere((task) => task.getId == id);
    notifyListeners();
    saveTask();
  }

  void toggleTaskDone(String id) {
    final task = _task.firstWhere((task) => task.getId == id);
    task.isDone = !task.isDone;
    notifyListeners();
    saveTask();
  }

  String getTitle(String id) {
    return _task.firstWhere((task) => task.getId == id).getTitle;
  }

  bool isDone(String id) {
    return _task.firstWhere((task) => task.getId == id).isDone;
  }

  Future<void> saveTask() async {
    return await PrefHelpper.saveTasks(tasks);
  }

  Future<void> getTask() async {
    _task = await PrefHelpper.getTaks();
    notifyListeners();
  }
}
