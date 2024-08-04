import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/action_ayat_widget.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/number_widget.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/translate_widget.dart';
import 'package:just_audio/just_audio.dart';

class ItemAyatWidget extends StatelessWidget {
  const ItemAyatWidget({super.key, required this.ayat, this.onTap});
  final Ayat ayat;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 242, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NumberWidget(nomor: ayat.id),
                  Row(
                    children: [
                      ActionAyatWidget(
                        icon: Icons.play_arrow,
                        onTap: onTap,
                      ),
                      const SizedBox(width: 10),
                      const ActionAyatWidget(icon: Icons.bookmark),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ayat.arab,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.primary,
                      height: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ayat.latin,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppPallete.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TranslateWidget(
                  translate: ayat.terjemahan,
                  noteNumber: ayat.noteNumber,
                  noteText: ayat.noteText,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
