import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyrics_app/data/repositories/lyrics_repository.dart';

import '../../../../utils/constant.dart';
import '../../models/track_response.dart';

part 'lyrics_event.dart';
part 'lyrics_state.dart';

class LyricsBloc extends Bloc<LyricsEvent, LyricsState> {
  final Track track;
  final LyricsRepository lyricsRepository;
  LyricsBloc({required this.track, required this.lyricsRepository}) : super(LyricsState(track: track)) {
    on<LyricsLoadedEvent>(fetchLyrics);
  }

  FutureOr<void> fetchLyrics(
      LyricsLoadedEvent event, Emitter<LyricsState> emit) async {
    try {
      Track lyric = await lyricsRepository.getTrackLyrics(track);
      emit(state.copyWith(status: LyricsStatus.success, track: lyric));
    } catch (error) {
      emit(state.copyWith(status: LyricsStatus.failure));
    }
  }
}
