import 'package:flutter/material.dart';
import 'package:task_app/screens/recyle_bin.dart';
import 'package:task_app/screens/tabs_screen.dart';
import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            child: const Text('Task Drawer'),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Tasks'),
                    trailing: Text(
                        '${state.pendingTasks.length}|${state.completedTasks.length}'),
                  ));
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ));
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            },
          )
        ],
      ),
    ));
  }
}
