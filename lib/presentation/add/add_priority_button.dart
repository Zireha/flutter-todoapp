import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_new/provider/form_validation/validation_provider.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class AddPriorityButton extends StatefulWidget {
  final int? existingPriority;
  final bool isEditMode;

  const AddPriorityButton({super.key, this.existingPriority, this.isEditMode = false});

  @override
  State<AddPriorityButton> createState() => _AddPriorityButtonState();
}

class _AddPriorityButtonState extends State<AddPriorityButton> {
  int? _selectedPriority;

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ValidationProvider>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Wrap(
            spacing: 14.0,
            children:
                List.generate(3, (int index) {
                  final labels = ["Rendah", "Sedang", "Tinggi"];
                  final colors = [
                    MyColors.lowPriority,
                    MyColors.mediumPriority,
                    MyColors.highPriority,
                  ];

                  final priorityValue = index + 1;

                  return ChoiceChip(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    label: Text(
                      labels[index],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColors.background,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    selectedColor: colors[index],
                    selected: _selectedPriority == priorityValue,
                    backgroundColor: colors[index].withAlpha(100),
                    showCheckmark: false,
                    side: BorderSide.none,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedPriority = selected ? priorityValue : null;
                        if (_selectedPriority != null) {
                          validationService.changePriority(_selectedPriority!);
                        }
                      });
                    },
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
