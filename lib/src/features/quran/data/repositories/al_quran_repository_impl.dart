import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/features/quran/data/datasources/al_quran_remote_datasource.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/domain/entities/surah.dart';
import 'package:ibadahku/src/features/quran/domain/repositories/al_quran_repository.dart';

class AlQuranRepositoryImpl implements AlQuranRepository {
  final AlQuranRemoteDatasource alQuranRemoteDatasource;

  AlQuranRepositoryImpl({required this.alQuranRemoteDatasource});

  @override
  Future<Either<Failure, List<Surah>>> getAllSurah() async {
    try {
      final result = await alQuranRemoteDatasource.getAllSurah();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Ayat>>> getAyatBySurah(String id) async {
    try {
      final result = await alQuranRemoteDatasource.getAyatBySurah(id);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
