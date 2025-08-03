import 'package:flutter/material.dart';
import 'package:todoapp_new/styles/color/colors.dart';
import 'package:todoapp_new/styles/theme/colors.dart';
import 'package:todoapp_new/styles/typography/text_app_theme.dart';

class AppTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: TextAppTheme.primaryDisplayLarge,
      displayMedium: TextAppTheme.primaryDisplayMedium,
      displaySmall: TextAppTheme.primaryDisplaySmall,
      titleLarge: TextAppTheme.primaryTitleLarge,
      titleMedium: TextAppTheme.primaryTitleMedium,
      bodyLarge: TextAppTheme.secondaryDisplayLarge,
      bodyMedium: TextAppTheme.secondaryDisplayMedium,
      bodySmall: TextAppTheme.secondaryDisplaySmall,
      labelLarge: TextAppTheme.secondaryTitleLarge,
      labelMedium: TextAppTheme.secondaryTitleMedium
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.titleLarge, backgroundColor: MyColors.foreground
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: AppColor.blue.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
      scaffoldBackgroundColor: Colors.indigo[100]
    );
  }
}