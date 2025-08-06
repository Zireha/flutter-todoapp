import 'package:flutter/material.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class TaskCard extends StatefulWidget {

  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool? val = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 90,
                decoration: BoxDecoration(
                  color: MyColors.highPriority,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12, right: 52),
                  color: Color(0x0fffffff),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nama Tugas Disini",
                        style: TextTheme.of(
                          context,
                        ).bodySmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Deskripsi tugas, yang panjang gitulah. Ini cuma contoh aja sih jadi gatau hasilnya gimana",
                        style: TextTheme.of(context).labelLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "31 Agustus 2025",
                            style: TextTheme.of(context).labelMedium,
                          ),
                          SizedBox(width: 24.0),
                          Text("24.00", style: TextTheme.of(context).labelMedium?.copyWith(
                              fontWeight: FontWeight.w500
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Checkbox(
                value: val,
                fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return MyColors.foreground.withAlpha(100);
                  }
                  return MyColors.background;
                }),
                side: WidgetStateBorderSide.resolveWith(
                        (Set<WidgetState> states) {
                      return BorderSide.none;
                    }
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                activeColor: MyColors.foreground,
                onChanged: (bool? newVal) {
                  setState(() {
                    val = newVal;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
