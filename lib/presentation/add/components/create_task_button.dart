import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/data/model/task.dart';
import 'package:todoapp_new/provider/data/local_db_provider.dart';
import 'package:todoapp_new/provider/form_validation/validation_provider.dart';
import 'package:todoapp_new/static/action_page_enum.dart';

import '../../../styles/theme/colors.dart';

class CreateTaskButton extends StatelessWidget {
  final bool isLoading;
  final bool isValid;
  final Task? existingTask;
  final ActionPageEnum actionPageEnum;

  const CreateTaskButton({
    super.key,
    required this.isLoading,
    required this.isValid,
    required this.actionPageEnum,
    this.existingTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: isValid ? MyColors.foreground : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed:
            isValid && !isLoading ? () => _handleSaveTask(context) : null,
        child:
            isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                : Text(
                  actionPageEnum.isEdit ? "Perbarui Tugas" : "Buat Tugas",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: MyColors.background,
                  ),
                ),
      ),
    );
  }

  Future<void> _handleSaveTask(BuildContext context) async {
    final formProvider = Provider.of<ValidationProvider>(
      context,
      listen: false,
    );
    final dbProvider = Provider.of<LocalDBProvider>(context, listen: false);

    formProvider.setLoading(true);

    try {
      if (actionPageEnum.isEdit && existingTask != null) {
        final updatedTask = formProvider.updateTask(existingTask!.id!);
        await dbProvider.updateTask(existingTask!.id!, updatedTask);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Task telah diperbarui"),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        final task = formProvider.createTask();
        await dbProvider.saveTask(task);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task berhasil disimpan!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }

      if (context.mounted) {
        formProvider.clearForm();
        Navigator.pop(context);
        dbProvider.loadAllTasks();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              actionPageEnum.isEdit
                  ? 'Gagal memperbarui task: ${e.toString()}'
                  : 'Gagal menyimpan task: ${e.toString()}',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      formProvider.setLoading(false);
    }
  }
}
