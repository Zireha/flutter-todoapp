import 'package:flutter/material.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/presentation/home/home_screen.dart';
import 'package:todoapp_new/styles/theme/app_theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.instance.initDb();
  await DBHelper.instance.inititializeTask();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
