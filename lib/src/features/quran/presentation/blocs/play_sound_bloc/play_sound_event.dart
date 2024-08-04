part of 'play_sound_bloc.dart';

sealed class PlaySoundEvent extends Equatable {
  const PlaySoundEvent();

  @override
  List<Object> get props => [];
}

class PlayAyat extends PlaySoundEvent {
  final String url;

  const PlayAyat({required this.url});
}
