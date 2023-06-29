import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/data_providers/duty_apr_provider/duty_api_provider.dart';
import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

@LazySingleton(as: GetDutyRepository)
class GetDutyRepoImplementation implements GetDutyRepository {
  DutyApiProvider apiProvider = getIt<DutyApiProvider>();
  @override
  Future<GetDutyModel> getDuty() async {
    final response = await apiProvider.getDutyDetailsFromApi();
    GetDutyModel result = response.fold((msg) {
      return GetDutyModel(message: msg);
    }, (resp) {
      return GetDutyModel.fromJson(resp.data);
    });
    return result;
  }

  @override
  Future<bool> sendOtp() async {
    return await apiProvider.getOtpForPunchIn();
  }
}
