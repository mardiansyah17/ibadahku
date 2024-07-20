import 'package:dio/dio.dart';
import 'package:ibadahku/src/features/prayer_time/data/models/prayer_time_model.dart';

abstract interface class PrayerTimeRemoteDatasource {
  Future<PrayerTimeModel> getPrayerTime(String city);
}

class PrayerRemoteDatasourceImpl implements PrayerTimeRemoteDatasource {
  final Dio dio;

  PrayerRemoteDatasourceImpl(this.dio);

  @override
  Future<PrayerTimeModel> getPrayerTime(String city) {
    // TODO: implement getPrayerTime
    throw UnimplementedError();
  }
}
