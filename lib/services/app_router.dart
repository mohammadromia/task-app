import 'package:flutter/material.dart';
import 'package:task_app/screens/recyle_bin.dart';
import 'package:task_app/screens/tabs_screen.dart';
import 'package:task_app/screens/pending_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routerSettings) {
    switch (routerSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: ((_) => const RecycleBin()));
      case PendingTasksScreen.id:
        return MaterialPageRoute(builder: ((_) => const PendingTasksScreen()));
      case TabsScreen.id:
        return MaterialPageRoute(builder: ((_) => const TabsScreen()));

      default:
        return null;
    }
  }
}
