import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/provider/form_validation/validation_provider.dart';
import 'components/create_task_button.dart';
import 'components/task_datetime_row.dart';
import 'components/task_detail_field.dart';
import 'components/task_form_header.dart';
import 'components/task_priority_section.dart';
import 'components/task_title_field.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final formProvider = Provider.of<ValidationProvider>(
        context,
        listen: false,
      );

      
      titleController.addListener(
            () => formProvider.setTaskTitle(titleController.text),
      );
      detailController.addListener(
            () => formProvider.setTaskDescription(detailController.text),
      );
      dateController.addListener(
            () => formProvider.setDate(dateController.text),
      );
      timeController.addListener(
            () => formProvider.setTime(timeController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ValidationProvider>(
      builder: (context, formProvider, child) {
        return Wrap(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const TaskFormHeader(),
                  const SizedBox(height: 24),
                  TaskTitleField(controller: titleController),
                  const SizedBox(height: 20),
                  TaskDetailField(controller: detailController),
                  const SizedBox(height: 20),
                  TaskDateTimeRow(
                    dateController: dateController,
                    timeController: timeController,
                  ),
                  const SizedBox(height: 20),
                  const TaskPrioritySection(),
                  const SizedBox(height: 18),
                  CreateTaskButton(
                    isLoading: formProvider.isLoading,
                    isValid: formProvider.isValid,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    titleController.dispose();
    detailController.dispose();
    super.dispose();
  }
}
