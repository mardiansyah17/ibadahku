import 'package:dartz/dartz.dart';
import 'package:ibadahku/src/core/errors/failures.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
