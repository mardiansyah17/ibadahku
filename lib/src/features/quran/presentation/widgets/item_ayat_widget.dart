import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/action_ayat_widget.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/number_widget.dart';

class ItemAyatWidget extends StatelessWidget {
  final Ayat ayat;
  const ItemAyatWidget({super.key, required this.ayat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 209, 242, 255),
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
                      ActionAyatWidget(icon: Icons.play_arrow),
                      SizedBox(width: 10),
                      ActionAyatWidget(icon: Icons.bookmark),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 15, top: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ayat.arab,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.primary,
                      height: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ayat.latin,
                    style: TextStyle(
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

class TranslateWidget extends StatelessWidget {
  final String translate;
  final String? noteNumber;
  final String? noteText;

  const TranslateWidget({
    super.key,
    required this.translate,
    this.noteNumber,
    this.noteText,
  });

  @override
  Widget build(BuildContext context) {
    if (noteNumber == null && noteText == null) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: translate,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
    List<Widget> spans = [];
    int start = 0;
    int index = translate.indexOf(noteNumber!);

    while (index != -1) {
      if (index > start) {
        spans.add(Text(
          translate.substring(start, index),
          style: const TextStyle(color: Colors.black),
        ));
      }
      spans.add(Tooltip(
        enableTapToDismiss: true,
        showDuration: const Duration(minutes: 2),
        triggerMode: TooltipTriggerMode.tap,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppPallete.primary),
          // buatkan shadow tipis
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        textStyle: const TextStyle(color: AppPallete.primary),
        message: noteText!,
        child: Text(
          " $noteNumber",
          style: const TextStyle(color: AppPallete.primary),
        ),
      ));
      start = index + noteNumber!.length;
      index = translate.indexOf(noteNumber!, start);
    }

    if (start < translate.length) {
      spans.add(Text(
        translate.substring(start),
        style: const TextStyle(color: Colors.black),
      ));
    }
    return Container(
      margin: const EdgeInsets.only(top: 5),
      alignment: Alignment.centerLeft,
      child: Row(
        children: spans,
      ),
    );
  }
}
