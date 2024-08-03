import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/core/usecase/usecase.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/domain/repositories/al_quran_repository.dart';

class GetListAyatBySurah implements UseCase<List<Ayat>, ParamGetAyatBySurah> {
  final AlQuranRepository repository;

  GetListAyatBySurah(this.repository);

  @override
  Future<Either<Failure, List<Ayat>>> call(ParamGetAyatBySurah params) async {
    return await repository.getAyatBySurah(params.surat,
        lastAyat: params.lastAyat);
  }
}

class ParamGetAyatBySurah {
  final String surat;
  final int lastAyat;

  ParamGetAyatBySurah({required this.surat, required this.lastAyat});
}
