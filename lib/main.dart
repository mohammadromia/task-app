import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/screens/tabs_screen.dart';
import 'package:task_app/services/app_router.dart';
import 'package:task_app/services/app_theme.dart';
import 'blocs/bloc_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        )
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            onGenerateRoute: appRouter.onGenerateRoute,
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.lightTheme]
                : AppThemes.appThemeData[AppTheme.darkTheme],
            home: const TabsScreen(),
          );
        },
      ),
    );
  }
}
