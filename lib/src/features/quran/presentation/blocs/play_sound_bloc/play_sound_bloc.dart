import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'play_sound_event.dart';
part 'play_sound_state.dart';

class PlaySoundBloc extends Bloc<PlaySoundEvent, PlaySoundState> {
  PlaySoundBloc() : super(PlaySoundInitial()) {
    on<PlaySoundEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
