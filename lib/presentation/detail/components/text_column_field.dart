import 'package:flutter/material.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class TextColumnField extends StatelessWidget {
  final String header;
  final String body;

  const TextColumnField({super.key, required this.header, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(header, style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: MyColors.background
        )),
        Text(body, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: MyColors.background
        )),
      ],
    );
  }
}
