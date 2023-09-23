import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/todo.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  List<Todo> get todos => _todos;

  TodoProvider() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks');
    if (taskList != null) {
      _todos = taskList.map((taskJson) {
        final taskMap = json.decode(taskJson) as Map<String, dynamic>;
        return Todo(
          title: taskMap['title'] as String,
          completionTime:
              DateTime.tryParse(taskMap['completionTime'] as String) ??
                  DateTime.now(),
          isdone: taskMap['isDone'] as bool,
        );
      }).toList();
      notifyListeners();
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = _todos.map((task) => json.encode(task.toJson())).toList();
    await prefs.setStringList('tasks', taskList);
  }

  void AddTodo(String title, String? desc, DateTime? completionTime) {
    _todos.add(Todo(
      title: title,
      desc: desc,
      completionTime: completionTime,
    ));

    _saveTasks();

    notifyListeners();
  }

  void removetodo(
    int index,
  ) {
    todos.removeAt(index);

    if (index >= 0 && index < todos.length) {
      todos[index].completionTime = null;
    }
    _saveTasks();
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _todos[index].isdone = !_todos[index].isdone;
    _saveTasks();
    notifyListeners();
  }
}
