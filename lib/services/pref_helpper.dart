import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/models/task_model.dart';

class PrefHelpper {
  static const String _key = "tasks";
  static Future<void> saveTasks(List<TaskModel> tasks) async {
    final pref = await SharedPreferences.getInstance();
    List<String>? jsonList = tasks
        .map((tasks) => jsonEncode(tasks.toJson()))
        .toList();
    await pref.setStringList(_key, jsonList);
  }

  static Future<List<TaskModel>> getTaks() async {
    final pref = await SharedPreferences.getInstance();
    List<String>? jsonList = pref.getStringList(_key);
    jsonList ??= [];
    return jsonList
        .map((jsonStr) => TaskModel.fromJson(jsonDecode(jsonStr)))
        .toList();
  }
}
