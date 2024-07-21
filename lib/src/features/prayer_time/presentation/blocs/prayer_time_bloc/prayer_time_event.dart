part of 'prayer_time_bloc.dart';

abstract class PrayerTimeEvent extends Equatable {
  const PrayerTimeEvent();

  @override
  List<Object> get props => [];
}

final class LoadPrayerTime extends PrayerTimeEvent {
  final String date;

  const LoadPrayerTime({required this.date});
}
