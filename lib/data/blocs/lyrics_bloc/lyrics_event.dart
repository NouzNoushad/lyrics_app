part of 'lyrics_bloc.dart';

sealed class LyricsEvent extends Equatable {
  const LyricsEvent();

  @override
  List<Object> get props => [];
}

class LyricsLoadedEvent extends LyricsEvent {
  const LyricsLoadedEvent();

  @override
  List<Object> get props => [];
}
