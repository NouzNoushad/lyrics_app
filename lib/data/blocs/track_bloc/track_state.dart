part of 'track_bloc.dart';

class TrackState extends Equatable {
  final TrackStatus status;
  final List<Track> tracks;
  const TrackState({this.status = TrackStatus.initial, this.tracks = const <Track>[]});

  TrackState copyWith({TrackStatus? status, List<Track>? tracks}) {
    return TrackState(status: status ?? this.status, tracks: tracks ?? this.tracks);
  }

  @override
  List<Object> get props => [status, tracks];
}
