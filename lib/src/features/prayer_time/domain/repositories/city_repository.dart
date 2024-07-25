import 'package:dartz/dartz.dart';
import 'package:ibadahku/src/core/errors/failures.dart';
import 'package:ibadahku/src/features/prayer_time/domain/entities/city.dart';

abstract interface class CityRepository {
  Future<Either<Failure, List<City>>> getCities();
}
