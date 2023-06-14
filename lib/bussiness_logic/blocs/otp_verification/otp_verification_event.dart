part of 'otp_verification_bloc.dart';

@immutable
abstract class OtpVerificationEvent {}

class VerifySignUpOtp extends OtpVerificationEvent {
  final OtpModel otp;
  VerifySignUpOtp({required this.otp});
}
