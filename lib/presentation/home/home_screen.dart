import 'package:flutter/material.dart';
import 'package:todoapp_new/presentation/home/priority_button.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var user = "Pengguna";

    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.foreground,
        title: Text(
          "Todo App",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: MyColors.background,
            fontWeight: FontWeight.w700
          ),
        ),
        elevation: 20,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 16.0, top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Pagi, $user",
                    style: TextTheme.of(context).displayLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: MyColors.foreground
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Apa aja aktivitasmu hari ini?",
                    style: TextTheme.of(context).titleLarge?.copyWith(
                      color: MyColors.foreground
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text(
                    'Semua Tugas',
                    style: TextTheme.of(context).displayMedium,
                  ),
                  SizedBox(height: 8,),
                  const PriorityButton(),
                  SizedBox(height: 20,),
                  // TODO: Display all tasks from DB here
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
