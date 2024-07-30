import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/core/widgets/app_loading.dart';
import 'package:ibadahku/src/core/widgets/app_search_widget.dart';
import 'package:ibadahku/src/features/quran/presentation/blocs/surah_bloc/surah_bloc.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/item_surah_widget.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    super.initState();

    context.read<SurahBloc>().add(GetSurah());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: AppSearchWidget(),
          toolbarHeight: 65,
        ),
        body: BlocBuilder<SurahBloc, SurahState>(
          builder: (context, state) {
            log(state.toString());
            if (state is SurahLoading) {
              return const Center(
                child: AppLoading(),
              );
            }
            if (state is SurahLoaded) {
              log(state.toString());
              return Column(
                children: [
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   padding: EdgeInsets.only(left: 10),
                  //   child: Text(
                  //     "Terakhir dibaca",
                  //     style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //         color: AppPallete.primary),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // SizedBox(
                  //   height: 120,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: false,
                  //       itemCount: 10,
                  //       itemBuilder: (context, index) {
                  //         return LastReadItemWidget();
                  //       }),
                  // ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.surahFilterByName == null
                            ? state.surah!.length
                            : state.surahFilterByName!.length,
                        itemBuilder: (context, index) {
                          return ItemSurahWidget(
                            surah: state.surahFilterByName == null
                                ? state.surah![index]
                                : state.surahFilterByName![index],
                          );
                        }),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
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
