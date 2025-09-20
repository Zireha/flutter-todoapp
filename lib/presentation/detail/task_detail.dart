import 'package:provider/provider.dart';
import 'package:todoapp_new/presentation/detail/components/detail_opt_button.dart';
import 'package:todoapp_new/presentation/detail/components/text_column_field.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_new/provider/detail/detail_provider.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class TaskDetail extends StatefulWidget {
  final int id;

  const TaskDetail({super.key, required this.id});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<DetailProvider>().getTaskDetail(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Consumer<DetailProvider>(
          builder: (context, detailProvider, child) {
            final taskDetail = detailProvider.taskDetail;

            if (taskDetail == null) {
              return const Center(
                child: Text("Gagal menampilkan detail tugas"),
              );
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      "Detail Tugas",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: MyColors.background,
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 54,
                    children: [
                      TextColumnField(header: "Tanggal", body: taskDetail.date),
                      TextColumnField(header: "Waktu", body: taskDetail.time),
                      TextColumnField(
                        header: "Prioritas",
                        body: taskDetail.taskPriority == 1 ? "Rendah" : taskDetail.taskPriority == 2 ? "Sedang" : "Tinggi"
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextColumnField(
                    header: "Judul Tugas",
                    body: taskDetail.taskTitle,
                  ),
                  SizedBox(height: 28),
                  TextColumnField(
                    header: "Detail Tugas",
                    body:
                        taskDetail.taskDescription,
                  ),
                  SizedBox(height: 26),
                  DetailOptButton(id: widget.id,),
                  SizedBox(height: 160,)
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
