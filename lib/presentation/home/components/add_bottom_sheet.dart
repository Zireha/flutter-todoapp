import 'package:todoapp_new/presentation/add/task_form.dart';
import 'package:todoapp_new/static/action_page_enum.dart';
import 'package:todoapp_new/styles/theme/colors.dart';
import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
            builder: (BuildContext context) => TaskForm(actionPageEnum: ActionPageEnum.add,),
          );
        },
      );
  }
}