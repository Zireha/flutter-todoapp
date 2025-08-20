import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/data/model/task_model.dart';

class DetailProvider extends ChangeNotifier {

  final DBHelper _dbHelper = DBHelper.instance;
  List<Task> _task = [];



  Future<void> getTaskDetail(String id) async {

  }
}
