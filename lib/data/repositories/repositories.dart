import 'package:shiftsync/data/models/attendence_model/attendence_model.dart';
import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';
import 'package:shiftsync/data/models/leave_status_history_model/leave_status_history_model.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';

abstract class GetDutyRepository {
  Future<GetDutyModel> getDuty();
  Future<bool> sendOtp();
  Future<bool> veryfyOtp({required OtpModel otp});
  Future<bool> punchOut();
}

abstract class GetLeaveStatusHistoryRepository {
  Future<LeaveStatusHistoryModel> getLeaveStatusHistory();
}

abstract class AttendenceRepository {
  Future<AttendenceModel> getAttendence();
}
