import 'package:dartz/dartz.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/features/quran/domain/entities/surah.dart';

abstract interface class SurahRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();
}
