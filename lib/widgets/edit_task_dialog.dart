import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/task_provider.dart';

class EditTaskDialog extends StatelessWidget {
  final String id;
    final TextEditingController controller;

  const EditTaskDialog({super.key, required this.id, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit The Task Title"),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancile"),
        ),
        TextButton(
          onPressed: () {
            context.read<TaskProvider>().editTask(
              id,
              controller.text.toString(),
            );
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
