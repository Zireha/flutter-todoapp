import 'package:flutter/material.dart';
import 'package:todoapp_new/presentation/add/components/task_date_field.dart';
import 'package:todoapp_new/presentation/add/components/task_time_field.dart';

class TaskDateTimeRow extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;

  const TaskDateTimeRow({
    super.key,
    required this.dateController,
    required this.timeController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TaskDateField(controller: dateController),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TaskTimeField(controller: timeController),
        ),
      ],
    );
  }
}