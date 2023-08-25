import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyrics_app/data/models/track_response.dart';
import 'package:lyrics_app/data/repositories/lyrics_repository.dart';

import '../../../../utils/constant.dart';

part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  final LyricsRepository lyricsRepository;
  TrackBloc({required this.lyricsRepository}) : super(const TrackState()) {
    on<TrackFetchedEvent>(fetchTracks);
  }

  FutureOr<void> fetchTracks(
      TrackFetchedEvent event, Emitter<TrackState> emit) async {
    try {
      List<Track> tracks = await lyricsRepository.getLyricsChart();
      emit(state.copyWith(status: TrackStatus.success, tracks: tracks));
    } catch (error) {
      emit(state.copyWith(status: TrackStatus.failure, tracks: []));
    }
  }
}
