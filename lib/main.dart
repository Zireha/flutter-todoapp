import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/data/db_helper.dart';
import 'package:todoapp_new/presentation/home/home_screen.dart';
import 'package:todoapp_new/provider/data/local_db_provider.dart';
import 'package:todoapp_new/styles/theme/app_theme.dart';

void main() async {

  DBHelper dbHelper = DBHelper();
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initDb();
  await dbHelper.initializeTask();

  runApp(
    MultiProvider(
      providers: [
        Provider<DBHelper>(create: (context) => DBHelper()),
        ChangeNotifierProvider(
          create: (context) => LocalDBProvider(context.read<DBHelper>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
