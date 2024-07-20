import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/item_surah_widget.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/number_widget.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 35,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Terakhir dibaca",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.primary),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return LastReadItemWidget();
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ItemSurahWidget();
                }),
          ),
        ],
      ),
    );
  }
}

class LastReadItemWidget extends StatelessWidget {
  const LastReadItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 180),
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppPallete.second,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Al-Fatihah",
                style: TextStyle(color: AppPallete.white),
              ),
              Text(
                "Ayat 1-7",
                style: TextStyle(color: AppPallete.white),
              ),
            ],
          ))),
    );
  }
}
