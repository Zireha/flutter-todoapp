import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp_new/presentation/add/add_priority_button.dart';
import 'package:todoapp_new/presentation/add/time_form.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Center(
                child: Text(
                  "Buat Tugas Baru",
                  style: TextTheme.of(
                    context,
                  ).displayLarge?.copyWith(color: MyColors.foreground),
                ),
              ),
              SizedBox(height: 24),
              Text('Nama Tugas', style: TextTheme.of(context).bodySmall),
              SizedBox(height: 6),
              TextFormField(
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
                style: TextTheme.of(context).bodySmall,
              ),
              SizedBox(height: 20),
              Text('Detail Tugas', style: TextTheme.of(context).bodySmall),
              SizedBox(height: 6),
              TextFormField(
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
                style: TextTheme.of(context).bodySmall,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              const TimeForm(),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Prioritas", style: TextTheme.of(context).bodySmall),
                  const AddPriorityButton(),
                ],
              ),
              SizedBox(height: 18),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: MyColors.foreground,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                        "Buat Tugas Baru",
                      style: TextTheme.of(context).displaySmall?.copyWith(
                        color: MyColors.background
                      ),
                    )
                ),
              ),
              SizedBox(height: 32,)
            ],
          ),
        ),
      ],
    );
  }
}
