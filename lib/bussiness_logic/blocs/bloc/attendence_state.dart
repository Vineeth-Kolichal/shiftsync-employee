part of 'attendence_bloc.dart';

@freezed
class AttendenceState with _$AttendenceState {
  const factory AttendenceState({
    required bool isLoading,
    required List<Attendance> attendenceList,
    required bool hasError
  }) = _Initial;

   factory AttendenceState.loading()=>const  AttendenceState(isLoading: true, attendenceList: [], hasError: false);
}
