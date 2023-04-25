import 'package:flutter/material.dart';
import 'package:new_task_list/app/app_routes.dart';
import 'package:new_task_list/components/taks_tile.dart';
import 'package:new_task_list/provider/tasks.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {

    final Tasks tasks = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Chamados'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.TASK_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.count,
        itemBuilder: (context, index) => TaskTile(tasks.byIndex(index)),
      ),
    );
  }
}