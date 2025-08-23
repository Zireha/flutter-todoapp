import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/data/model/task_model.dart';

class HomeProvider extends ChangeNotifier {
  late final DBHelper _dbHelper;
  List<Task> _task = [];

  List<Task>? get task => _task;

  Future<void> getTaskList() async {
    _task = (await _dbHelper.queryAllTask());
    notifyListeners();
  }
}