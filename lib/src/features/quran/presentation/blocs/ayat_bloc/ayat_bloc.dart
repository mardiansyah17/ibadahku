import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/domain/usecases/get_list_ayat_by_surah.dart';

part 'ayat_event.dart';
part 'ayat_state.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  final GetListAyatBySurah getAllAyatBySurah;
  AyatBloc({required this.getAllAyatBySurah}) : super(AyatInitial()) {
    on<AyatEvent>((event, emit) {
      emit(AyatLoading());
    });
    on<GetAyatBySurah>((event, emit) async {
      final response =
          await getAllAyatBySurah(ParamGetAyatBySurah(surat: event.id));
      response.fold((l) => log(l.errorMessage), (r) {
        emit(AyatLoaded(ayat: r));
      });
    });
  }
}
