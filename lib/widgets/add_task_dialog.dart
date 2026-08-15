import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/task_provider.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key,});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return AlertDialog(
      title: Text("Add New Task"),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            context.read<TaskProvider>().addTask(controller.text.toString());
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
