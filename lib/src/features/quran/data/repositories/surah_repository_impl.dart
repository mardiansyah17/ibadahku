import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:ibadahku/src/features/quran/domain/entities/surah.dart';
import 'package:ibadahku/src/features/quran/domain/repositories/surah_repository.dart';

class SurahRepositoryImpl implements SurahRepository {
  final QuranRemoteDatasource quranRemoteDatasource;

  SurahRepositoryImpl({required this.quranRemoteDatasource});

  @override
  Future<Either<Failure, List<Surah>>> getAllSurah() async {
    try {
      final result = await quranRemoteDatasource.getAllSurah();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
