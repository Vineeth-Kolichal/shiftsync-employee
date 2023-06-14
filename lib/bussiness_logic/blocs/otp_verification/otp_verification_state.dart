part of 'otp_verification_bloc.dart';

class OtpVerificationState {
  final bool isLoading;
  OtpVerificationState({required this.isLoading});
}

class OtpVerificationInitial extends OtpVerificationState {
  OtpVerificationInitial() : super(isLoading: false);
}

class OtpVerificationLoadingState extends OtpVerificationState {
  OtpVerificationLoadingState() : super(isLoading: true);
}

class OtpVerificationResponseState extends OtpVerificationState {
  final SignUpOtpResponseModel signUpOtpResponseModel;
  OtpVerificationResponseState(
      {required this.signUpOtpResponseModel, required super.isLoading});
}
