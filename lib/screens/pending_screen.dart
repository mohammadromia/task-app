import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});
  static const id = "tasks_screen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskslist = state.pendingTasks;

        return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Chip(
                label: Text(
                    '${state.pendingTasks.length} Pending|${state.completedTasks.length} Compledted')),
          ),
          TaskList(taskslist: taskslist)
        ]);
      },
    );
  }
}
