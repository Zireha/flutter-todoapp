import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDateField extends StatelessWidget {
  final TextEditingController controller;

  const TaskDateField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Tanggal"),
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
            hintText: DateFormat("dd-MM-yyyy").format(DateTime.now()),
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
          readOnly: true,
          onTap: () => _selectDate(context),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }
}