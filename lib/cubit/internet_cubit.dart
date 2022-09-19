import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionSatate {
  final bool connected;
  MyConnectionSatate(this.connected);
}

class ConnectionCubit extends Cubit<MyConnectionSatate> {
  late StreamSubscription<ConnectivityResult> _subscription;
  ConnectionCubit() : super(MyConnectionSatate(false)) {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      emit(MyConnectionSatate(result != ConnectivityResult.none));
    });
  }
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
