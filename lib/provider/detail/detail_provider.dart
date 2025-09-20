import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/data/model/task.dart';

class DetailProvider extends ChangeNotifier {
  late final DBHelper _dbHelper;

  String _message = "";
  String get message => _message;

  DetailProvider() {
    _dbHelper = DBHelper();
  }

  Task? _taskDetail;
  Task? get taskDetail => _taskDetail;

  Future<void> getTaskDetail(int id) async {
    try {
      _taskDetail = await _dbHelper.getTaskById(id);
    } catch (e) {
      _taskDetail = null;
    }
    notifyListeners();
  }
}
