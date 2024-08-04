import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

part 'play_sound_event.dart';
part 'play_sound_state.dart';

class PlaySoundBloc extends Bloc<PlaySoundEvent, PlaySoundState> {
  PlaySoundBloc() : super(PlaySoundInitial()) {
    final AudioPlayer player = AudioPlayer();
    on<PlaySoundEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<StopAyat>(
      (event, emit) {
        log('stop');
        player.stop();
        emit(PlaySoundInitial());
      },
    );
    on<PlayAyat>((event, emit) async {
      emit(PlaySoundLoading());

      if (player.playing) {
        log('lagi play');
        player.stop();
        add(StopAyat());
      } else {
        await player.setUrl(event.url);
        player.play();
        player.playerStateStream.listen((event) {
          log(event.processingState.toString());
          if (event.processingState == ProcessingState.completed) {
            log('triger stoped');
            add(StopAyat());
          }
        });
        emit(PlayingAyat(id: event.id));
      }
    });
  }
}
