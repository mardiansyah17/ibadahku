import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ibadahku/src/features/prayer_time/data/datasources/remote/city_remote_data_source.dart';
import 'package:ibadahku/src/features/prayer_time/data/datasources/remote/prayer_time_remote_datasource.dart';
import 'package:ibadahku/src/features/prayer_time/data/repositories/city_repository_impl.dart';
import 'package:ibadahku/src/features/prayer_time/data/repositories/prayer_time_repository_impl.dart';
import 'package:ibadahku/src/features/prayer_time/domain/repositories/city_repository.dart';
import 'package:ibadahku/src/features/prayer_time/domain/repositories/prayer_time_repository.dart';
import 'package:ibadahku/src/features/prayer_time/domain/usecases/get_cities.dart';
import 'package:ibadahku/src/features/prayer_time/domain/usecases/get_prayer_time.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/blocs/city_bloc/city_bloc.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/blocs/prayer_time_bloc/prayer_time_bloc.dart';
import 'package:ibadahku/src/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:ibadahku/src/features/quran/data/repositories/surah_repository_impl.dart';
import 'package:ibadahku/src/features/quran/domain/repositories/surah_repository.dart';
import 'package:ibadahku/src/features/quran/domain/usecases/get_all_surah.dart';
import 'package:ibadahku/src/features/quran/presentation/blocs/surah_bloc/surah_bloc.dart';

final sl = GetIt.instance;

Future initDepedencies() async {
  sl.registerLazySingleton(() => Dio());
  initPrayerTime();
  initCityBloc();
  initSurahBloc();
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

void initCityBloc() {
  sl
    ..registerFactory<CityRemoteDataSource>(
        () => CityRemoteDataSourceImpl((sl())))
    ..registerFactory<CityRepository>(() => CityRepositoryImpl(sl()))
    ..registerFactory<GetCities>(() => GetCities(sl()))
    ..registerLazySingleton<CityBloc>(() => CityBloc(getCities: sl()));
}

void initSurahBloc() {
  sl
    ..registerFactory<QuranRemoteDatasource>(
        () => QuranRemoteDatasourceImpl(sl()))
    ..registerFactory<SurahRepository>(
        () => SurahRepositoryImpl(quranRemoteDatasource: sl()))
    ..registerFactory<GetAllSurah>(() => GetAllSurah(sl()))
    ..registerLazySingleton<SurahBloc>(() => SurahBloc(getAllSurah: sl()));
}
