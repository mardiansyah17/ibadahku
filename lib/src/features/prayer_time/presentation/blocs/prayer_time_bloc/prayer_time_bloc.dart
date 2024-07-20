import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibadahku/src/features/prayer_time/domain/entities/prayer_time.dart';
import 'package:ibadahku/src/features/prayer_time/domain/usecases/get_prayer_time.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prayer_time_event.dart';
part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  final GetPrayerTime _getPrayerTime;
  PrayerTimeBloc({required GetPrayerTime getPrayerTime})
      : _getPrayerTime = getPrayerTime,
        super(PrayerTimeInitial()) {
    on<PrayerTimeEvent>((event, emit) => emit(PrayerTimeLoading()));
    on<LoadPrayerTime>(_onLoadPrayerTime);
  }

  Future<void> _onLoadPrayerTime(
    LoadPrayerTime event,
    Emitter<PrayerTimeState> emit,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cityId = prefs.get('cityId');
    final cityName = prefs.get('cityName');

    if (cityName == null || cityId == null) {
      return emit(LocationIsNotExist());
    }

    final failureOrPrayerTime = await _getPrayerTime(
        GetPrayerTimeParams(city: "0813", date: "2024-07-20"));
    failureOrPrayerTime.fold((l) {
      log("ada error ${l.errorMessage}");
    }, (r) {
      emit(PrayerTimeLoaded(r));
    });
  }
}
