import 'package:flutter/material.dart';

class TaskTitleField extends StatelessWidget {
  final TextEditingController controller;

  const TaskTitleField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nama Tugas', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "Judul tugas disini",
            hintStyle: TextStyle(color: Colors.black.withAlpha(25)),
          ),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}