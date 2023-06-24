part of 'leave_request_bloc.dart';

@immutable
abstract class LeaveRequestEvent {}

class RequestForLeave extends LeaveRequestEvent {
  final LeaveRequestModel leaveRequestModel;
  RequestForLeave({required this.leaveRequestModel});
}
