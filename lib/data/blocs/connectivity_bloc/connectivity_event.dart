part of 'connectivity_bloc.dart';

sealed class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ConnectedEvent extends ConnectivityEvent {
  const ConnectedEvent();

  @override
  List<Object> get props => [];
}