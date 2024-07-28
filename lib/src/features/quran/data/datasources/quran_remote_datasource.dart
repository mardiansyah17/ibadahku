import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ibadahku/src/core/constants/base_url.dart';
import 'package:ibadahku/src/features/quran/data/models/surah_model.dart';

abstract interface class QuranRemoteDatasource {
  Future<List<SurahModel>> getAllSurah(String surah, String ayat);
}

class QuranRemoteDatasourceImpl implements QuranRemoteDatasource {
  final Dio dio;

  QuranRemoteDatasourceImpl(this.dio);

  @override
  Future<List<SurahModel>> getAllSurah(String surah, String ayat) async {
    try {
      final response = await dio.get("$baseUrlQuran/surat/semua");

      return (response.data['data'] as List)
          .map((e) => SurahModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
