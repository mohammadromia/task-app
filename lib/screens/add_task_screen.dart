import 'package:flutter/material.dart';
import 'package:task_app/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final decriptionController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Tilte'), border: OutlineInputBorder()),
          ),
        ),
        TextFormField(
          autofocus: true,
          controller: decriptionController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
              label: Text('Descripton'), border: OutlineInputBorder()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  var task = Task(
                      date: DateTime.now().toString(),
                      id: GUIDGen.generate(),
                      descripton: decriptionController.text,
                      title: titleController.text);
                  context.read<TasksBloc>().add(AddTask(task: task));
                },
                child: const Text('Add'))
          ],
        ),
      ]),
    );
  }
}
