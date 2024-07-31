import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/core/widgets/app_loading.dart';
import 'package:ibadahku/src/features/quran/presentation/blocs/ayat_bloc/ayat_bloc.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/item_ayat_widget.dart';

class DetailSurahScreen extends StatefulWidget {
  final String id;
  final String name;
  const DetailSurahScreen({super.key, required this.id, required this.name});

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AyatBloc>().add(GetAyatBySurah(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          surfaceTintColor: Colors.transparent,
        ),
        body: BlocBuilder<AyatBloc, AyatState>(
          builder: (context, state) {
            if (state is AyatLoading) {
              return const AppLoading();
            }
            ;
            if (state is AyatLoaded) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ",
                    //     style: TextStyle(
                    //         fontSize: 25,
                    //         color: AppPallete.primary,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.ayat.length,
                        itemBuilder: (context, index) {
                          return ItemAyatWidget(
                            ayat: state.ayat[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
