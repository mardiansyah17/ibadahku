import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibadahku/src/core/usecase/usecase.dart';
import 'package:ibadahku/src/features/prayer_time/domain/entities/city.dart';
import 'package:ibadahku/src/features/prayer_time/domain/usecases/get_cities.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final GetCities _getCities;
  CityBloc({required GetCities getCities})
      : _getCities = getCities,
        super(CityInitial()) {
    on<CityEvent>((event, emit) {
      emit(CityLoading());
    });
    on<LoadedCities>(_onLoadCities);
  }

  Future<void> _onLoadCities(
    LoadedCities event,
    Emitter<CityState> emit,
  ) async {
    final cities = await _getCities(NoParams());
    cities.fold((l) {
      log("ada error ${l.errorMessage}");
    }, (r) {
      emit(CityLoaded(r));
    });
  }
}
