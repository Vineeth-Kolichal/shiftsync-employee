import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';

abstract class GetDutyRepository {
  Future<GetDutyModel> getDuty();
  Future<bool> sendOtp();
}
