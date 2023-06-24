part of 'leave_request_bloc.dart';

@immutable
abstract class LeaveRequestState {}

class LeaveRequestInitial extends LeaveRequestState {}

class LeaveRequestLoading extends LeaveRequestState {}

class LeaveRequestResponseState extends LeaveRequestState {
  final LeaveRequestRespModel leaveRequestRespModel;
  LeaveRequestResponseState({required this.leaveRequestRespModel});
}
