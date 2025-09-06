import 'package:flutter/material.dart';

import '../../../styles/theme/colors.dart';

class TaskFormHeader extends StatelessWidget {
  const TaskFormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Buat Tugas Baru",
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
          color: MyColors.foreground,
        ),
      ),
    );
  }
}