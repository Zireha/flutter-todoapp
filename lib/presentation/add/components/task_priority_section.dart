import 'package:flutter/material.dart';

import '../add_priority_button.dart';

class TaskPrioritySection extends StatelessWidget {
  const TaskPrioritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prioritas", style: Theme.of(context).textTheme.bodySmall),
        const AddPriorityButton(),
      ],
    );
  }
}