part of 'prayer_time_bloc.dart';

abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

// state cek apakah sudah mendapatkan lokasi
class PrayerTimeLocationLoaded extends PrayerTimeState {
  final Map<String, double> location;

  const PrayerTimeLocationLoaded(this.location);

  @override
  List<Object> get props => [location];
}
