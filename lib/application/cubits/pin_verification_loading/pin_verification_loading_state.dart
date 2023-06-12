part of 'pin_verification_loading_cubit.dart';

class PinVerificationLoadingState {
  final bool isLoading;
  final bool isWrongPin;

  PinVerificationLoadingState(
      {required this.isLoading, required this.isWrongPin});
}

class PinVerificationLoadingInitial extends PinVerificationLoadingState {
  PinVerificationLoadingInitial() : super(isLoading: false, isWrongPin: false);
}
