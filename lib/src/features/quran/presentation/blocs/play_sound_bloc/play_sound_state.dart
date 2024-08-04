part of 'play_sound_bloc.dart';

sealed class PlaySoundState extends Equatable {
  const PlaySoundState();

  @override
  List<Object> get props => [];
}

final class PlaySoundInitial extends PlaySoundState {}

final class PlaySoundLoading extends PlaySoundState {}

final class PlayingAyat extends PlaySoundState {}

final class AyatStoped extends PlaySoundState {}
