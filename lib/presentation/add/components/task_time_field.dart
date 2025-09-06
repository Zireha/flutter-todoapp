import 'package:flutter/material.dart';

class TaskTimeField extends StatelessWidget {
  final TextEditingController controller;

  const TaskTimeField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final localization = MaterialLocalizations.of(context);
    final timeFormat = localization.formatTimeOfDay(TimeOfDay.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Waktu"),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: timeFormat,
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
          readOnly: true,
          onTap: () => _selectTime(context, localization),
        ),
      ],
    );
  }

  Future<void> _selectTime(BuildContext context, MaterialLocalizations localization) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      controller.text = localization.formatTimeOfDay(pickedTime);
    }
  }
}