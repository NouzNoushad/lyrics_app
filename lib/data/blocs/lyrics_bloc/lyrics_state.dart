part of 'lyrics_bloc.dart';

class LyricsState extends Equatable {
  final LyricsStatus status;
  final Track track;
  const LyricsState({
    this.status = LyricsStatus.initial,
    required this.track,
  });

  LyricsState copyWith({LyricsStatus? status, Track? track}) {
    return LyricsState(
        track: track ?? this.track, status: status ?? this.status);
  }

  @override
  List<Object> get props => [track, status];
}

