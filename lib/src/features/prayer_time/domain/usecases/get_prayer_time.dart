import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/core/usecase/usecase.dart';
import 'package:ibadahku/src/features/prayer_time/domain/entities/prayer_time.dart';
import 'package:ibadahku/src/features/prayer_time/domain/repositories/prayer_time_repository.dart';

class GetPrayerTime implements UseCase<PrayerTime, GetPrayerTimeParams> {
  final PrayerTimeRepository repository;

  GetPrayerTime(this.repository);

  @override
  Future<Either<Failure, PrayerTime>> call(GetPrayerTimeParams params) async {
    return await repository.getPrayerTime(params.city, params.date);
  }
}

class GetPrayerTimeParams {
  final String city;
  final String date;

  GetPrayerTimeParams({required this.city, required this.date});
}
