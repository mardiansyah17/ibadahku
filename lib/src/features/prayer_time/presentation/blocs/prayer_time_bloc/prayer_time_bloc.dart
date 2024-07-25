import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibadahku/src/features/prayer_time/domain/entities/prayer_time.dart';
import 'package:ibadahku/src/features/prayer_time/domain/usecases/get_prayer_time.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
    final cityId = prefs.getString('cityId');
    final cityName = prefs.getString('cityName');

    if (cityName == null || cityId == null) {
      return emit(LocationIsNotExist());
    }
    final bool checkInternetConnection =
        await InternetConnectionChecker().hasConnection;

    if (!checkInternetConnection) {
      return emit(InternetIsNotConnected());
    }
    final date = event.date;
    log(date);
    final DateTime dateTime = DateTime.parse(date);

    final failureOrPrayerTime =
        await _getPrayerTime(GetPrayerTimeParams(city: cityId, date: date));
    failureOrPrayerTime.fold((l) {
      log("ada error ${l.errorMessage}");
    }, (r) {
      emit(PrayerTimeLoaded(cityId: cityId, date: dateTime, prayerTime: r));
    });
  }

  Map<String, String> _getNextTime(PrayerTime prayerTime) {
    DateTime now = DateTime.now();
    log(prayerTime.tanggal);
    // prayerTime.toMap().forEach((key, item) {
    //   log("$key : $item");
    // });

    return {
      "nextTime": "12:00",
      "nextPrayer": "Dzuhur",
    };
  }
}
