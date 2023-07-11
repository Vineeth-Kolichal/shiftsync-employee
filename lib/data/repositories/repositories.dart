import 'package:shiftsync/data/models/attendence_model/attendence_model.dart';
import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';
import 'package:shiftsync/data/models/leave_status_history_model/leave_status_history_model.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';
import 'package:shiftsync/data/models/salary_details_model/salary_details_model.dart';
import 'package:shiftsync/data/models/salary_history_model/salary_history_model.dart';

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

abstract class GetSalaryDetailsRepository {
  Future<SalaryDetailsModel> getSalaryDetails();
}

abstract class SalaryTransactionHistoryRepository {
  Future<SalaryHistoryModel> getSalaryTransactionHistory();
}
