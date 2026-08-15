import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/task_provider.dart';
import 'package:to_do_list/widgets/edit_task_dialog.dart';

class CustomListTaile extends StatefulWidget {
  final String id;

  const CustomListTaile({super.key, required this.id});

  @override
  State<CustomListTaile> createState() => _CustomListTaileState();
}

class _CustomListTaileState extends State<CustomListTaile> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Text(
            context.watch<TaskProvider>().getTitle(widget.id),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              decoration: context.watch<TaskProvider>().isDone(widget.id)
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: context.watch<TaskProvider>().isDone(widget.id)
                  ? Colors.black45
                  : Colors.black,
            ),
          ),
          Spacer(),
          Checkbox(
            value: context.watch<TaskProvider>().isDone(widget.id),
            onChanged: (v) =>
                context.read<TaskProvider>().toggleTaskDone(widget.id),
          ),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                controller.text = context.watch<TaskProvider>().getTitle(
                  widget.id,
                );
                return EditTaskDialog(id: widget.id, controller: controller);
              },
            ),
            child: Icon(Icons.edit, color: Colors.green, size: 30),
          ),
          GestureDetector(
            onTap: () => context.read<TaskProvider>().deleteTask(widget.id),

            child: Icon(Icons.delete, color: Colors.red, size: 30),
          ),
        ],
      ),
    );
  }
}
