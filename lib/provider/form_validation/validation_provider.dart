import 'package:flutter/material.dart';
import '../../data/model/task.dart';

class ValidationProvider extends ChangeNotifier {
  String _taskTitle = '';
  String _taskDescription = '';
  String _date = '';
  String _time = '';
  int? _priority;
  bool _isLoading = false;
  bool _isEditMode = false;

  String get taskTitle => _taskTitle;
  String get taskDescription => _taskDescription;
  String get date => _date;
  String get time => _time;
  int? get priority => _priority;
  bool get isLoading => _isLoading;
  bool get isEditMode => _isEditMode;

  bool get isValid {
    if (_isEditMode) {
      // Di mode edit, minimal ada 1 field yang berubah atau semua field valid
      return _taskTitle.isNotEmpty &&
          _taskDescription.isNotEmpty &&
          _date.isNotEmpty &&
          _time.isNotEmpty &&
          _priority != null;
    } else {
      // Di mode create, semua field harus terisi
      return _taskTitle.isNotEmpty &&
          _taskDescription.isNotEmpty &&
          _date.isNotEmpty &&
          _time.isNotEmpty &&
          _priority != null;
    }
  }

  void setEditMode(bool isEdit) {
    _isEditMode = isEdit;
    notifyListeners();
  }

  void setTaskTitle(String value) {
    _taskTitle = value;
    notifyListeners();
  }

  void setTaskDescription(String value) {
    _taskDescription = value;
    notifyListeners();
  }

  void setDate(String value) {
    _date = value;
    notifyListeners();
  }

  void setTime(String value) {
    _time = value;
    notifyListeners();
  }

  void changePriority(int value) {
    _priority = value;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Task createTask() {
    return Task(
      taskTitle: _taskTitle,
      taskDescription: _taskDescription,
      date: _date,
      time: _time,
      taskPriority: _priority!,
    );
  }

  void fillValueWithExistingTask(Task task) {
    _taskTitle = task.taskTitle;
    _taskDescription = task.taskDescription;
    _date = task.date;
    _time = task.time;
    _priority = task.taskPriority;
    notifyListeners();
  }

  Task updateTask(int taskId) {
    return Task(
      id: taskId,
      taskTitle: _taskTitle,
      taskDescription: _taskDescription,
      date: _date,
      time: _time,
      taskPriority: _priority!,
    );
  }

  void clearForm() {
    _taskTitle = '';
    _taskDescription = '';
    _date = '';
    _time = '';
    _priority = null;
    _isLoading = false;
    notifyListeners();
  }
}
