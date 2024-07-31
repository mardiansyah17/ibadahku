import 'package:dartz/dartz.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/domain/entities/surah.dart';

abstract interface class AlQuranRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();

  Future<Either<Failure, List<Ayat>>> getAyatBySurah(String id);
}
