import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/data/model/task_model.dart';

class LocalDBProvider extends ChangeNotifier {
  final DBHelper _dbHelper;
  LocalDBProvider(this._dbHelper);

  String _message = "";
  String get message => _message;

  List<Task>? _taskList;
  List<Task>? get taskList => _taskList;

  Task? _task;
  Task? get task => _task;

  Future<void> saveTask(Task value) async {
    try {
      final result = await _dbHelper.insertTask(value);
      final isError = result == 0;

      if(isError) {
        _message = "Failed to create task";
        notifyListeners();
      } else {
        _message = "Task saved";
        notifyListeners();
      }

    } catch (e) {
      _message = "Task failed to save";
      notifyListeners();
    }
  }

  Future<void> loadAllTasks() async {
    try {
      _taskList = await _dbHelper.queryAllTask();
      notifyListeners();
    } catch (e) {
      _message = "Failed to load tasks. Error: $e";
    }
  }

  Future<void> loadTaskById(int id) async {
    try {
      _task = await _dbHelper.getTaskById(id);
      notifyListeners();
    } catch (e) {
      _message ="Failed to load selected task";
      notifyListeners();
    }
  }

  Future<void> updateTask(int id, Task value) async {
    try {
      final result = await _dbHelper.updateTask(id, value);
      final isEmptyRowUpdated = result == 0;
      if(isEmptyRowUpdated) {
        _message = "Failed to update task";
        notifyListeners();
      } else {
        _message = "Data updated";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to update task";
      notifyListeners();
    }
  }

  Future<void> deleteTaskById(int id) async {
    try {
      await _dbHelper.removeTask(id);
      _message = "Task deleted";
      notifyListeners();
    } catch (e) {
      _message = "Failed to delete task";
      notifyListeners();
    }
  }
}