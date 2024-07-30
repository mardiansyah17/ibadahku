import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/action_ayat_widget.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/number_widget.dart';

class ItemAyatWidget extends StatelessWidget {
  const ItemAyatWidget({super.key});

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
                  NumberWidget(nomor: "1"),
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
                    "اَلۡحَمۡدُ لِلّٰهِ رَبِّ الۡعٰلَمِيۡنَۙ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Al-ḥamdu lillāhi rabbil-‘ālamīn(a).",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppPallete.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pujian bagi Allah, Tuhan semesta alam.",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
