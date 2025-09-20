import 'package:flutter/material.dart';
import 'package:todoapp_new/presentation/detail/task_detail.dart';
import 'package:todoapp_new/presentation/home/components/task_body.dart';
import 'package:todoapp_new/styles/theme/colors.dart';
import '../../data/model/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool? val = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.task;

    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: TaskBody(task: item),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: MyColors.foreground,
          context: context,
          showDragHandle: true,
          isDismissible: true,
          enableDrag: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) => TaskDetail(id: item.id as int)
        );
      },
    );
  }
}
