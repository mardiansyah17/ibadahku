import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/number_widget.dart';

class ItemSurahWidget extends StatelessWidget {
  const ItemSurahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(123, 128, 173, 0.35),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NumberWidget(
            nomor: 1,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Al-Fatihah",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "الفاتحة",
                  style:
                      const TextStyle(fontSize: 18, color: AppPallete.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
