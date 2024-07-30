import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/action_ayat_widget.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/item_ayat_widget.dart';

class DetailSurahScreen extends StatelessWidget {
  const DetailSurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Al-Fatihah"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ",
                  style: TextStyle(
                      fontSize: 25,
                      color: AppPallete.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ItemAyatWidget();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
