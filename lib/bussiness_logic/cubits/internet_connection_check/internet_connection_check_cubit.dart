import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_connection_check_state.dart';

class InternetConnectionCheckCubit extends Cubit<InternetConnectionCheckState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  InternetConnectionCheckCubit({required this.connectivity})
      : super(InternetConnectionCheckLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        emitIntenetConnected();
      } else {
        emitNoInternet();
      }
    });
  }
  void emitNoInternet() {
    emit(InternetDisconnected());
  }

  void emitIntenetConnected() {
    emit(InternetConnected());
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
