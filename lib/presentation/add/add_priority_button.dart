import 'package:flutter/material.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class AddPriorityButton extends StatefulWidget {
  const AddPriorityButton({super.key});

  @override
  State<AddPriorityButton> createState() => _AddPriorityButtonState();
}

class _AddPriorityButtonState extends State<AddPriorityButton> {
  int? _val = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Wrap(
              spacing: 14.0,
              children:
              List.generate(3, (int index) {
                final label = ["Tinggi", "Sedang", "Rendah"];
                final colors = [
                  MyColors.highPriority,
                  MyColors.mediumPriority,
                  MyColors.lowPriority,
                ];

                return ChoiceChip(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  label: Text(
                    label[index],
                    style: TextTheme.of(context).bodySmall?.copyWith(
                      color: MyColors.background,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
            )
        ),
      ],
    );
  }
}
