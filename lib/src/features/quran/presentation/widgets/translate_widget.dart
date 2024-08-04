import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';

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
