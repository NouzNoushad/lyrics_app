import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/constant.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity connectivity;
  ConnectivityBloc({required this.connectivity})
      : super(const ConnectivityState()) {
    on<ConnectedEvent>(connectNetwork);
  }

  FutureOr<void> connectNetwork(
      ConnectedEvent event, Emitter<ConnectivityState> emit) async {
    final connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      emit(state.copyWith(status: ConnectivityStatus.connected));
    } else if (connectivityResult == ConnectivityResult.none) {
      emit(state.copyWith(status: ConnectivityStatus.disconnected));
    }
  }
}
