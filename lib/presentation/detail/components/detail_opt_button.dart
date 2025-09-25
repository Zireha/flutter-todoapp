import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/data/model/task.dart';
import 'package:todoapp_new/presentation/add/task_form.dart';
import 'package:todoapp_new/provider/data/local_db_provider.dart';
import 'package:todoapp_new/static/action_page_enum.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class DetailOptButton extends StatefulWidget {
  final int? id;
  final Task? task;
  const DetailOptButton({super.key, required this.id, this.task});

  @override
  State<DetailOptButton> createState() => _DetailOptButtonState();
}

class _DetailOptButtonState extends State<DetailOptButton> {
  @override
  Widget build(BuildContext context) {
    final localDBProvider = Provider.of<LocalDBProvider>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () async {
            if (widget.id == null) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Gagal Menghapus Data")));
              return;
            }

            final result = await showDialog(
              context: context,
              builder:
                  (BuildContext context) => AlertDialog(
                    title: Text("Hapus Tugas?"),
                    content: Text("Anda yakin ingin menghapus tugas?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, "Batal");
                        },
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, "Ya");
                        },
                        child: const Text("Ya"),
                      ),
                    ],
                  ),
            );

            if (result == "Ya") {
              try {
                await localDBProvider.deleteTaskById(widget.id as int);
                await localDBProvider.loadAllTasks();

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Berhasil menghapus tugas"),
                    backgroundColor: Colors.green,
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Gagal menghapus tugas, error: $e"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: MyColors.background,
            backgroundColor: Colors.red,
            minimumSize: Size(84, 30),
          ),
          child: Icon(Icons.delete, color: MyColors.background),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => _navigateToEditTask(widget.task),
          style: ElevatedButton.styleFrom(
            foregroundColor: MyColors.background,
            minimumSize: Size(84, 30),
          ),
          child: Icon(Icons.edit),
        ),
      ],
    );
  }

  void _navigateToEditTask(Task? task) {
    Navigator.pop(context);
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder:
          (BuildContext context) =>
              TaskForm(actionPageEnum: ActionPageEnum.edit, existingTask: task,),
    );
  }
}
