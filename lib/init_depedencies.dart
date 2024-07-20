import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ibadahku/src/features/prayer_time/data/datasources/remote/prayer_time_remote_datasource.dart';
import 'package:ibadahku/src/features/prayer_time/data/repositories/prayer_time_repository_impl.dart';
import 'package:ibadahku/src/features/prayer_time/domain/repositories/prayer_time_repository.dart';
import 'package:ibadahku/src/features/prayer_time/domain/usecases/get_prayer_time.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/blocs/prayer_time_bloc/prayer_time_bloc.dart';

final sl = GetIt.instance;

Future initDepedencies() async {
  sl.registerLazySingleton(() => Dio());
  initPrayerTime();
}

void initPrayerTime() {
  sl
    ..registerFactory<PrayerTimeRemoteDatasource>(
        () => PrayerTimeRemoteDatasourceImpl(sl()))
    ..registerFactory<PrayerTimeRepository>(
        () => PrayerTimeRepositoryImpl(sl()))
    ..registerFactory<GetPrayerTime>(() => GetPrayerTime(sl()))
    ..registerLazySingleton<PrayerTimeBloc>(
        () => PrayerTimeBloc(getPrayerTime: sl()));
}
