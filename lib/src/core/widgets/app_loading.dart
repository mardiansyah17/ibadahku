import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppPallete.primary,
      ),
    );
  }
}
