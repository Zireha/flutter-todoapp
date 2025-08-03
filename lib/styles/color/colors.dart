import 'package:flutter/material.dart';

enum AppColor {
  blue("Indigo", Colors.indigo);

  const AppColor(this.name, this.color);

  final String name;
  final Color color;
}