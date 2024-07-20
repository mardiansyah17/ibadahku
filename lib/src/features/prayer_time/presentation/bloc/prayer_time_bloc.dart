import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prayer_time_event.dart';
part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  PrayerTimeBloc() : super(PrayerTimeInitial()) {
    on<PrayerTimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
