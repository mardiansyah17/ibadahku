import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/quran/presentation/blocs/surah_bloc/surah_bloc.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({super.key});

  static OutlineInputBorder outlineInputBorder(
          {Color color = AppPallete.second, double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: width),
      );

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<SurahBloc>().add(SearchSurah(value));
      },
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
