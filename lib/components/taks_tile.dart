import 'package:flutter/material.dart';
import 'package:new_task_list/models/task.dart';

class TaskTile extends StatelessWidget {

  final Task task;

  const TaskTile(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: 
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset('assets/malwee_logo.png'),
      ),
      title: Text('N° do chamado: ${task.number}'),
      subtitle: Text(task.description),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.edit),
              color: Colors.orange,
            ),
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.delete),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}