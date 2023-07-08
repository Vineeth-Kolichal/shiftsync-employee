part of 'punch_in_screen_bloc.dart';

@freezed
class PunchInScreenEvent with _$PunchInScreenEvent {
  const factory PunchInScreenEvent.started() = Started;
  const factory PunchInScreenEvent.getDuty() = GetDuty;
  const factory PunchInScreenEvent.sendOtp() = SendOtp;
  factory PunchInScreenEvent.verifyOtp({required OtpModel otp}) = VerifyOtp;
  const factory PunchInScreenEvent.punchOut() = PunchOut;
}
