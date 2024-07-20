part of 'prayer_time_bloc.dart';

abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class LocationIsNotExist extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final PrayerTime prayerTime;

  const PrayerTimeLoaded(this.prayerTime);

  @override
  List<Object> get props => [prayerTime];
}
