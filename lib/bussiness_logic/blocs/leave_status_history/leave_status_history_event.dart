part of 'leave_status_history_bloc.dart';

@freezed
class LeaveStatusHistoryEvent with _$LeaveStatusHistoryEvent {
  const factory LeaveStatusHistoryEvent.started() = Started;
}
