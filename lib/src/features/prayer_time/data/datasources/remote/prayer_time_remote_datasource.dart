import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ibadahku/src/core/constants/base_url_prayer_time.dart';
import 'package:ibadahku/src/features/prayer_time/data/models/prayer_time_model.dart';

abstract interface class PrayerTimeRemoteDatasource {
  Future<PrayerTimeModel> getPrayerTime(String city, String date);
}

class PrayerTimeRemoteDatasourceImpl implements PrayerTimeRemoteDatasource {
  final Dio dio;

  PrayerTimeRemoteDatasourceImpl(this.dio);

  @override
  Future<PrayerTimeModel> getPrayerTime(String city, String date) async {
    try {
      final response =
          await dio.get("$baseUrlPrayerTime/sholat/jadwal/$city/$date");

      return PrayerTimeModel.fromJson(response.data['data']['jadwal']);
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
