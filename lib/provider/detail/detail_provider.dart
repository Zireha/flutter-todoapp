import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/data/model/task_model.dart';

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

  Future<bool> deleteTask(int id) async {
    try {
      await _dbHelper.removeTask(id);
      _dbHelper.queryAllTask;
      _message = "Berhasil menghapus tugas";
      notifyListeners();
      return true;
    } catch (e) {
      _message = "Gagal menghapus tugas, Error: $e";
      notifyListeners();
      return false;
    }
  }
}
