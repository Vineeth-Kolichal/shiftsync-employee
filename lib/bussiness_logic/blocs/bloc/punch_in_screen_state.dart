part of 'punch_in_screen_bloc.dart';

@freezed
class PunchInScreenState with _$PunchInScreenState {
  const factory PunchInScreenState(
      {required bool allLoading,
      required bool otpSendingLoading,
      GetDutyModel? dutymodel,
      bool? isSend}) = _Initial;

  factory PunchInScreenState.initial() => const PunchInScreenState(
        allLoading: true,
        otpSendingLoading: false,
      );
}
