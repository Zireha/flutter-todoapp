import 'package:flutter/material.dart';
import 'package:todoapp_new/data/validation_item.dart';

class Validation extends ChangeNotifier {
  ValidationItem _taskTitle = ValidationItem(value: null, error: null);
  ValidationItem _taskDescription = ValidationItem(value: null, error: null);
  ValidationItem _date = ValidationItem(value: null, error: null);
  ValidationItem _time = ValidationItem(value: null, error: null);

  // getters
  ValidationItem get taskTitle => _taskTitle;
  ValidationItem get taskDescription => _taskDescription;
  ValidationItem get date => _date;
  ValidationItem get time => _time;

  // setters
  void changeTitle(String value) {
    if(value.isNotEmpty) {
      _taskTitle = ValidationItem(value: value, error: null);
    } else {
      _taskTitle = ValidationItem(value: null, error: "Isi judul tugas anda");
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if(value.isNotEmpty) {
      _taskDescription = ValidationItem(value: value, error: null);
    } else {
      _taskDescription = ValidationItem(value: null, error: "Isi deskripsi tugas anda");
    }
    notifyListeners();
  }

  void changeDate(String value) {
    if(value.isNotEmpty) {
      _time = ValidationItem(value: value, error: null);
    } else {
      _time = ValidationItem(value: null, error: "Isi tanggal tugas anda");
    }
    notifyListeners();
  }

  void changeTime(String value) {
    if(value.isNotEmpty) {
      _date = ValidationItem(value: value, error: null);
    } else {
      _date = ValidationItem(value: null, error: "Isi waktu tugas anda");
    }
    notifyListeners();
  }
}