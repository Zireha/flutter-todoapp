import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/provider/home/priority_provider.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class PriorityButton extends StatefulWidget {
  const PriorityButton({super.key});

  @override
  State<PriorityButton> createState() => _PriorityButtonState();
}

class _PriorityButtonState extends State<PriorityButton> {
  @override
  Widget build(BuildContext context) {
    final priorityProvider = Provider.of<PriorityProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 16),
          Wrap(
            spacing: 12.0,
            children:
                List.generate(4, (int index) {
                  final label = ["Semua", "Rendah", "Sedang", "Tinggi"];
                  final colors = [
                    MyColors.foreground,
                    MyColors.lowPriority,
                    MyColors.mediumPriority,
                    MyColors.highPriority,
                  ];

                  return ChoiceChip(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    label: Text(
                      label[index],
                      style: TextTheme.of(context).bodySmall?.copyWith(
                        color: MyColors.background,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    selectedColor: colors[index],
                    selected: priorityProvider.priority == index,
                    backgroundColor: colors[index].withAlpha(100),
                    showCheckmark: false,
                    side: BorderSide.none,
                    onSelected: (bool selected) {
                      if (selected) {
                        priorityProvider.setPriority(index);
                      }
                    },
                  );
                }).toList(),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
