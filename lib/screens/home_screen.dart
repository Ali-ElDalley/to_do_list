import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:to_do_list/providers/task_provider.dart';
import 'package:to_do_list/widgets/add_task_dialog.dart';
import 'package:to_do_list/widgets/custom_list_taile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan, title: Text("Task list")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddTaskDialog());
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add, color: Colors.white, size: 35),
      ),
      body: context.watch<TaskProvider>().tasks.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "No tasks yet",
                style: TextStyle(fontSize: 20, color: Colors.black45),
              ),
            )
          : ListView.builder(
              itemCount: context.watch<TaskProvider>().tasks.length,
              itemBuilder: (context, index) {
                List<TaskModel> taskList = context
                    .watch<TaskProvider>()
                    .tasks
                    .reversed
                    .toList();
                return CustomListTaile(id: taskList[index].getId);
              },
            ),
    );
  }
}
