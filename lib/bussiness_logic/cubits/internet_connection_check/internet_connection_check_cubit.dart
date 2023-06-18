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
    //listening internet connectivity status
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        //if internet is connected
        emitIntenetConnected();
      } else {
        //if mobile is not connected to mobile data ro wifi then emit no internet

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
