import 'package:flutter/material.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class PriorityButton extends StatefulWidget {
  const PriorityButton({super.key});

  @override
  State<PriorityButton> createState() => _PriorityButtonState();
}

class _PriorityButtonState extends State<PriorityButton> {
  int? _val = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 16,),
          Wrap(
            spacing: 12.0,
            children: List.generate(4, (int index) {
              final label = ["Semua", "Tinggi", "Sedang", "Rendah"];
              final colors = [
                MyColors.foreground,
                MyColors.highPriority,
                MyColors.mediumPriority,
                MyColors.lowPriority,
              ];

              return ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 16 ,vertical: 8),
                label: Text(label[index], style: TextTheme.of(context).bodySmall?.copyWith(
                    color: MyColors.background,
                    fontWeight: FontWeight.w700
                ),),
                selectedColor: colors[index],
                selected: _val == index,
                backgroundColor: colors[index].withAlpha(100),
                showCheckmark: false,
                side: BorderSide.none,
                onSelected: (bool selected) {
                  setState(() {
                    // TODO: get every tasks from its priority filter
                    _val = selected ? index : null;
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(width: 16,),
        ],
      ),
    );
  }
}
