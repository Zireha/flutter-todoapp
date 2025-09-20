import 'package:flutter/material.dart';
import 'package:todoapp_new/data/model/task.dart';
import 'package:todoapp_new/presentation/home/components/task_checkbox.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class TaskBody extends StatelessWidget {
  final Task task;
  const TaskBody({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final item = task;

    return Row(
      children: [
        Container(
          width: 20,
          height: 90,
          decoration: BoxDecoration(
            color: priorityColor(item.taskPriority),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 12, right: 52),
            color: Color(0x0fffffff),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.taskTitle,
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  item.taskDescription,
                  style: TextTheme.of(context).labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(item.date, style: TextTheme.of(context).labelMedium),
                    SizedBox(width: 24.0),
                    Text(
                      item.time,
                      style: TextTheme.of(
                        context,
                      ).labelMedium?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const TaskCheckbox(),
      ],
    );
  }
}

Color priorityColor(int priority) =>
    priority == 1
        ? MyColors.lowPriority
        : priority == 2
        ? MyColors.mediumPriority
        : MyColors.highPriority;
