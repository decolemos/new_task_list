import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_task_list/data/dummy_tasks.dart';

import '../models/task.dart';

class Tasks with ChangeNotifier {
  final Map<String, Task> _items = {...DUMMY_TASKS};

  List<Task> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Task byIndex (int index) {
    return _items.values.elementAt(index);
  }

  void put(Task task) { 
    if(task.id != null && task.id!.trim().isNotEmpty && _items.containsKey(task.id)) {
      _items.update(task.id!, (_) => task);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => Task(
          id: id,
          number: task.number,
          applicant: task.applicant,
          description: task.description,
          sector: task.sector
        )
      );
    }
    notifyListeners();
  }

  void remove(Task task) {
    if(task.id != null) {
      _items.remove(task.id);
      notifyListeners();
    }
  }

}