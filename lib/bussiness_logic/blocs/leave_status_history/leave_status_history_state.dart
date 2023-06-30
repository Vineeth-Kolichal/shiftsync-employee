part of 'leave_status_history_bloc.dart';

@freezed
class LeaveStatusHistoryState with _$LeaveStatusHistoryState {
  const factory LeaveStatusHistoryState({
    required bool isLoading,
    LeaveStatusHistoryModel? lshModel,
  }) = _Initial;

  factory LeaveStatusHistoryState.initial() =>const  LeaveStatusHistoryState(
        isLoading: true,
      );
}
