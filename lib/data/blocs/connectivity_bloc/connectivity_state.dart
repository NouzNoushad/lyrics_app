part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  final ConnectivityStatus status;
  const ConnectivityState({
    this.status = ConnectivityStatus.loading,
  });

  ConnectivityState copyWith({ConnectivityStatus? status}) {
    return ConnectivityState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
