import 'package:shiftsync/data/data_providers/leave_request/leave_request_api.dart';
import 'package:shiftsync/data/models/leave_request_model/leave_request_model.dart';
import 'package:shiftsync/data/models/leave_request_resp_model/leave_request_resp_model.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

class LeaveRequestRepository {
  LeaveRequestApi leaveRequestApi = locator<LeaveRequestApi>();
  Future<LeaveRequestRespModel> submitLeaveApplication(
      {required LeaveRequestModel leaveRequestModel}) async {
    final response = await leaveRequestApi.submitApplication(leaveRequestModel);

    LeaveRequestRespModel leaveRequestRespModel = response.fold((message) {
      return LeaveRequestRespModel(message: message, status: 404);
    }, (resp) {
      return LeaveRequestRespModel.fromJson(resp.data);
    });

    return leaveRequestRespModel;
  }
}
