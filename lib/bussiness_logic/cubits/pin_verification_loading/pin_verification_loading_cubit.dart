import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/core/constants/shared_preference_key_names.dart';

part 'pin_verification_loading_state.dart';

class PinVerificationLoadingCubit extends Cubit<PinVerificationLoadingState> {
  PinVerificationLoadingCubit() : super(PinVerificationLoadingInitial());
  void changeLoadingState(bool newState) {
    return emit(
        PinVerificationLoadingState(isLoading: newState, isWrongPin: false));
  }

  void changeWrongPinState(bool newState) {
    return emit(
        PinVerificationLoadingState(isLoading: false, isWrongPin: newState));
  }

  Future<void> verifyPin(
      {required String pinValue,
      required BuildContext context,
      required String routeName}) async {
    changeLoadingState(true);
    final shared = await SharedPreferences.getInstance();
    final sharedvalue = shared.getString(pin);
    if (sharedvalue == pinValue) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        changeLoadingState(false);
        Navigator.of(context).pushReplacementNamed(routeName);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 3000), () {
        changeWrongPinState(true);
      });
    }
  }
}
