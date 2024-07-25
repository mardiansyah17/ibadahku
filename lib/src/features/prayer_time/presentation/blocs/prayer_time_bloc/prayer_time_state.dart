part of 'prayer_time_bloc.dart';

abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class LocationIsNotExist extends PrayerTimeState {}

class InternetIsNotConnected extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final DateTime date;
  final String cityId;
  final PrayerTime? prayerTime;
  final Map<String, String>? nextTime;

  const PrayerTimeLoaded({
    required this.date,
    required this.cityId,
    this.prayerTime,
    this.nextTime,
  });
}
