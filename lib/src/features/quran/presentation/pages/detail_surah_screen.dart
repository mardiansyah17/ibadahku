import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/src/core/widgets/app_loading.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/presentation/blocs/ayat_bloc/ayat_bloc.dart';
import 'package:ibadahku/src/features/quran/presentation/widgets/item_ayat_widget.dart';

class DetailSurahScreen extends StatefulWidget {
  final String surat;
  final String name;
  const DetailSurahScreen({super.key, required this.surat, required this.name});

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Ayat> ayat = [];
  @override
  void initState() {
    super.initState();

    context.read<AyatBloc>().add(GetAyatBySurah(
          surat: widget.surat,
        ));
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          surfaceTintColor: Colors.transparent,
        ),
        body: BlocConsumer<AyatBloc, AyatState>(
          listener: (context, state) {
            if (state is AyatLoaded) {
              setState(() {
                ayat = [...ayat, ...state.ayat];
              });
            }
          },
          builder: (context, state) {
            if (state is AyatLoading) {
              return const AppLoading();
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: ayat.length,
              itemBuilder: (context, index) {
                if (state is AyatLoadingPagination &&
                    index == ayat.length - 1) {
                  return const AppLoading();
                }
                return ItemAyatWidget(
                  ayat: ayat[index],
                );
              },
            );
          },
        ));
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<AyatBloc>().add(GetAyatBySurah(
            surat: widget.surat,
            lastAyat: int.parse(ayat.last.id),
          ));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    return _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}
