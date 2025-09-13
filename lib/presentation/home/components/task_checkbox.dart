import 'package:flutter/material.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class TaskCheckbox extends StatefulWidget {
  const TaskCheckbox({super.key});

  @override
  State<TaskCheckbox> createState() => _TaskCheckboxState();
}

class _TaskCheckboxState extends State<TaskCheckbox> {

bool? val = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: val,
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return MyColors.foreground.withAlpha(100);
        }
        return MyColors.background;
      }),
      side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
        return BorderSide.none;
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      activeColor: MyColors.foreground,
      onChanged: (bool? newVal) {
        setState(() {
          val = newVal;
        });
      },
    );
  }
}
