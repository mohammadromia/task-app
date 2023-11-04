import 'package:flutter/material.dart';
import 'package:task_app/widgets/task_tile.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskslist,
  });

  final List<Task> taskslist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskslist
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Text\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.title),
                      const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.descripton)
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
