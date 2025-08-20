import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/data/model/task_model.dart';

class HomeProvider extends ChangeNotifier {
  final DBHelper _dbHelper = DBHelper.instance;
  List<Task> _task = [];

  List<Task>? get task => _task;

  HomeProvider() {
    getTaskList();
  }

  Future<void> getTaskList() async {
    _task = (await _dbHelper.queryAllTask()).cast<Task>();
    notifyListeners();
  }
}