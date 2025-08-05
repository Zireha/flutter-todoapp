import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();

    final localization = MaterialLocalizations.of(context);
    final timeFormat = localization.formatTimeOfDay(TimeOfDay.now());


    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 172,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tanggal"),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: DateFormat("dd-MM-yyyy").format(DateTime.now()),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextTheme.of(context).bodySmall,
                      textAlign: TextAlign.center,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0,),
              Container(
                width: 172,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Waktu"),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: timeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: timeFormat,
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextTheme.of(context).bodySmall,
                      textAlign: TextAlign.center,
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                        );

                        if(pickedTime != null) {
                          timeController.text = localization.formatTimeOfDay(pickedTime);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
