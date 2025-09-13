import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/provider/data/local_db_provider.dart';
import 'package:todoapp_new/provider/detail/detail_provider.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class DetailOptionButton extends StatefulWidget {
  final int? id;
  const DetailOptionButton({super.key, required this.id});

  @override
  State<DetailOptionButton> createState() => _DetailOptionButtonState();
}

class _DetailOptionButtonState extends State<DetailOptionButton> {
  @override
  Widget build(BuildContext context) {
    final detailProvider = Provider.of<DetailProvider>(context);
    final localDBProvider = Provider.of<LocalDBProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FilledButton.icon(
          onPressed: () async {
            if (widget.id == null) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Gagal menghapus data")));
              return;
            }

            final result = await showDialog(
              context: context,
              builder:
                  (BuildContext context) => AlertDialog(
                    title: Text("Hapus Tugas?"),
                    content: Text("Anda yakin ingin menghapus tugas ini?"),
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
                await detailProvider.deleteTask(widget.id as int);
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
          label: Icon(Icons.delete),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Color(0xffB80101)),
            overlayColor: WidgetStateProperty.all(Color(0xffB80101)),
          ),
        ),
        SizedBox(width: 12),
        FilledButton.icon(
          onPressed: () {},
          label: Icon(Icons.edit, color: MyColors.foreground),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(MyColors.background),
            overlayColor: WidgetStateProperty.all(MyColors.background),
          ),
        ),
      ],
    );
  }
}
