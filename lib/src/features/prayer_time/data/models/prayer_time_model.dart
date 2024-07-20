import 'package:ibadahku/src/features/prayer_time/domain/entities/prayer_time.dart';

class PrayerTimeModel extends PrayerTime {
  PrayerTimeModel({
    required super.imsak,
    required super.subuh,
    required super.dhuha,
    required super.dzuhur,
    required super.ashar,
    required super.maghrib,
    required super.isya,
  });
}
