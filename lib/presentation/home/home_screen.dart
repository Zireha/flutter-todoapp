import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/presentation/home/components/add_bottom_sheet.dart';
import 'package:todoapp_new/presentation/home/components/home_screen_header.dart';
import 'package:todoapp_new/presentation/home/priority_button.dart';
import 'package:todoapp_new/presentation/home/task_card.dart';
import 'package:todoapp_new/provider/home/priority_provider.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

import '../../provider/data/local_db_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<LocalDBProvider>().loadAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.foreground,
        title: Text(
          "Todo App",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: MyColors.background,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 20,
      ),
      floatingActionButton: AddBottomSheet(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        children: [
          HomeScreenHeader(),
          const SizedBox(height: 8),
          const PriorityButton(),
          const SizedBox(height: 20),
          Consumer2<LocalDBProvider, PriorityProvider>(
            builder: (context, localDBProvider, priorityProvider, child) {
              final tasks = localDBProvider.taskList;

              if (tasks == null) {
                return const Center(child: Text("Tidak ada tugas"));
              }

              final displayTasks = localDBProvider.getFilteredTasks(
                priorityProvider.priority,
              );

              return Column(
                children:
                    displayTasks.map((task) => TaskCard(task: task)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
