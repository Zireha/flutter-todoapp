import 'package:flutter/material.dart';
import 'package:todoapp_new/styles/theme/colors.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const user = "Pengguna";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selamat Pagi, $user",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: MyColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Apa aja aktivitasmu hari ini?",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: MyColors.foreground),
          ),
          const SizedBox(height: 32),
          Text('Semua Tugas', style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }
}
