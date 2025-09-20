import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/data/model/task.dart';

class HomeProvider extends ChangeNotifier {
  late final DBHelper _dbHelper;

  List<Task> _task = [];
  List<Task>? get task => _task;

  String _message = "";
  String get message => _message;

  HomeProvider() {
    _dbHelper = DBHelper();
  }

  Future<void> getTaskList() async {
    try {
      _task = await _dbHelper.queryAllTask();
      notifyListeners();
    } catch (e) {
      _message = "Failed to load tasks. Error: $e";
    }
    ;
  }
}
