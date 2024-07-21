import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';

class PrayerTimeCountDownWidget extends StatelessWidget {
  const PrayerTimeCountDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ashar",
            style: TextStyle(fontSize: 20, color: AppPallete.white),
          ),
          const SizedBox(height: 5),
          Text(
            "16.20",
            style: TextStyle(fontSize: 22, color: AppPallete.white),
          ),
          const SizedBox(height: 5),
          Text(
            "2 jam 4 menit 30 detik lagi",
            style: TextStyle(fontSize: 16, color: AppPallete.white),
          ),
        ],
      ),
    );
  }
}
