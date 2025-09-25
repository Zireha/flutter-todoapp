import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/data/model/task.dart';
import 'package:todoapp_new/provider/data/local_db_provider.dart';
import 'package:todoapp_new/provider/detail/detail_provider.dart';
import 'package:todoapp_new/provider/form_validation/validation_provider.dart';
import 'package:todoapp_new/static/action_page_enum.dart';
import 'package:todoapp_new/styles/theme/colors.dart';
import 'components/create_task_button.dart';
import 'components/task_datetime_row.dart';
import 'components/task_priority_section.dart';

class TaskForm extends StatefulWidget {
  final Task? existingTask;
  final ActionPageEnum actionPageEnum;

  const TaskForm({super.key, this.existingTask, required this.actionPageEnum});

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

      if (widget.actionPageEnum.isEdit) {
        formProvider.setEditMode(true);

        titleController.text = widget.existingTask?.taskTitle ?? "";
        dateController.text = widget.existingTask?.date ?? "";
        timeController.text = widget.existingTask?.time ?? "";
        detailController.text = widget.existingTask?.taskDescription ?? "";

        if (widget.existingTask != null) {
          formProvider.fillValueWithExistingTask(widget.existingTask!);
        } else {
          formProvider.setEditMode(false);
        }
      }

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
                  Center(
                    child: Text(
                      widget.actionPageEnum.isEdit
                          ? "Edit Tugas"
                          : "Buat Tugas Baru",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: MyColors.foreground,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Tugas',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Judul tugas disini",
                          hintStyle: TextStyle(
                            color: Colors.black.withAlpha(25),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Tugas',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: detailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Detail tugas disini",
                          hintStyle: TextStyle(
                            color: Colors.black.withAlpha(25),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TaskDateTimeRow(
                    dateController: dateController,
                    timeController: timeController,
                  ),
                  const SizedBox(height: 20),
                  TaskPrioritySection(
                    existingPriority: widget.existingTask?.taskPriority,
                    isEditMode: widget.actionPageEnum.isEdit,
                  ),
                  const SizedBox(height: 18),
                  CreateTaskButton(
                    isLoading: formProvider.isLoading,
                    isValid: formProvider.isValid,
                    actionPageEnum: widget.actionPageEnum,
                    existingTask: widget.existingTask,
                  ),
                  const SizedBox(height: 64),
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
