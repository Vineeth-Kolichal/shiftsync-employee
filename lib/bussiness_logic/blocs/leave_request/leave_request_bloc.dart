import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftsync/data/models/leave_request_model/leave_request_model.dart';
import 'package:shiftsync/data/models/leave_request_resp_model/leave_request_resp_model.dart';
import 'package:shiftsync/data/repositories/leave_request_repository/leave_request_repository.dart';

part 'leave_request_event.dart';
part 'leave_request_state.dart';

class LeaveRequestBloc extends Bloc<LeaveRequestEvent, LeaveRequestState> {
  LeaveRequestRepository leaveRequestRepository = LeaveRequestRepository();
  LeaveRequestBloc() : super(LeaveRequestInitial()) {
    on<RequestForLeave>((event, emit) async {
      emit(LeaveRequestLoading());
      LeaveRequestRespModel leaveRequestRespModel = await leaveRequestRepository
          .submitLeaveApplication(leaveRequestModel: event.leaveRequestModel);
      emit(LeaveRequestResponseState(
          leaveRequestRespModel: leaveRequestRespModel));
    });
  }
}
