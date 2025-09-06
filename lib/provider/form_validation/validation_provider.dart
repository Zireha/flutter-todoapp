import 'package:flutter/material.dart';
import '../../data/model/task_model.dart';

class ValidationProvider extends ChangeNotifier {
  String _taskTitle = '';
  String _taskDescription = '';
  String _date = '';
  String _time = '';
  int? _priority;
  bool _isLoading = false;

  // Getters
  String get taskTitle => _taskTitle;
  String get taskDescription => _taskDescription;
  String get date => _date;
  String get time => _time;
  int? get priority => _priority;
  bool get isLoading => _isLoading;

  // Validation - all fields must be filled
  bool get isValid =>
      _taskTitle.isNotEmpty &&
          _taskDescription.isNotEmpty &&
          _date.isNotEmpty &&
          _time.isNotEmpty &&
          _priority != null;

  // Setters
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

  // Create task object
  Task createTask() {
    return Task(
      taskTitle: _taskTitle,
      taskDescription: _taskDescription,
      date: _date,
      time: _time,
      taskPriority: _priority!,
    );
  }

  // Clear form after successful save
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
