import 'package:dartz/dartz.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/core/usecase/usecase.dart';
import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';
import 'package:ibadahku/src/features/quran/domain/repositories/al_quran_repository.dart';

class GetAllAyatBySurah implements UseCase<List<Ayat>, ParamsGetAllSurahById> {
  final AlQuranRepository repository;

  GetAllAyatBySurah(this.repository);

  @override
  Future<Either<Failure, List<Ayat>>> call(ParamsGetAllSurahById params) async {
    return await repository.getAyatBySurah(params.id);
  }
}

class ParamsGetAllSurahById {
  final String id;

  ParamsGetAllSurahById({required this.id});
}
