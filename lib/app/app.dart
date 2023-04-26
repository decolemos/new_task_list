import 'package:flutter/material.dart';
import 'package:new_task_list/app/app_routes.dart';
import 'package:new_task_list/pages/task_form.dart';
import 'package:new_task_list/pages/tasks_list.dart';
import 'package:new_task_list/provider/tasks.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Tasks(),
        )
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.HOME: (_) => const TasksList(),
          AppRoutes.TASK_FORM: (_) => TaskForm()
        },
      ),
    );
  }
}