import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/presentation/home/priority_button.dart';
import 'package:todoapp_new/presentation/home/task_card.dart';
import 'package:todoapp_new/presentation/add/task_form.dart';
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
    const user = "Pengguna";

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.foreground,
        tooltip: 'add',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: const Icon(Icons.add, color: MyColors.background, size: 28),
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            enableDrag: true,
            isDismissible: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            context: context,
            builder: (BuildContext context) => TaskForm(),
          );
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        children: [
          // Header
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Pagi, $user",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: MyColors.foreground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Apa aja aktivitasmu hari ini?",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: MyColors.foreground,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Semua Tugas',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          const PriorityButton(),
          const SizedBox(height: 20),

          // Task list
          Consumer<LocalDBProvider>(
            builder: (context, value, child) {
              final tasks = value.taskList;

              if (tasks == null) {
                return const Center(child: Text("Tidak ada tugas"));
              }

              return Column(
                children: tasks.map((task) => TaskCard(task: task)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
