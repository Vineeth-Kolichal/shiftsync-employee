import 'package:shiftsync/data/models/attendence_model/attendence_model.dart';
import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';
import 'package:shiftsync/data/models/leave_status_history_model/leave_status_history_model.dart';

abstract class GetDutyRepository {
  Future<GetDutyModel> getDuty();
  Future<bool> sendOtp();
}

abstract class GetLeaveStatusHistoryRepository {
  Future<LeaveStatusHistoryModel> getLeaveStatusHistory();
}

abstract class AttendenceRepository {
  Future<AttendenceModel> getAttendence();
}
