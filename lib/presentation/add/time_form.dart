import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeForm extends StatelessWidget {
  const TimeForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();

    final localization = MaterialLocalizations.of(context);
    final timeFormat = localization.formatTimeOfDay(TimeOfDay.now());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 12,
      children: [
        Expanded(
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
                style: TextTheme
                    .of(context)
                    .bodySmall,
                textAlign: TextAlign.center,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    dateController.text =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
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
                style: TextTheme
                    .of(context)
                    .bodySmall,
                textAlign: TextAlign.center,
                readOnly: true,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime != null) {
                    timeController.text =
                        localization.formatTimeOfDay(pickedTime);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
