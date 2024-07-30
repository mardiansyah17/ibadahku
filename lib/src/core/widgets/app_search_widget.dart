import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';

class AppSearchWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const AppSearchWidget({super.key, this.onChanged});

  static OutlineInputBorder outlineInputBorder(
          {Color color = AppPallete.second, double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: width),
      );

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: AppPallete.primary),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: "Cari Surah",
        prefixIcon: const Icon(Icons.search),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(color: AppPallete.primary, width: 2),
      ),
    );
  }
}
