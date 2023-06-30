import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/data_providers/getLeaveStatusHistoryApiProvider/get_leave_status_history_api_provider.dart';
import 'package:shiftsync/data/models/leave_status_history_model/leave_status_history_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

@LazySingleton(as: GetLeaveStatusHistoryRepository)
class GetLeaveHistoryRepoImplementation
    extends GetLeaveStatusHistoryRepository {
  GetLeaveStatusHistoryApiProvider apiProvider =
      getIt<GetLeaveStatusHistoryApiProvider>();
  @override
  Future<LeaveStatusHistoryModel> getLeaveStatusHistory() async {
    final response = await apiProvider.getLeaveDataFromApi();
    LeaveStatusHistoryModel model = response.fold((sts) {
      return LeaveStatusHistoryModel(status: sts, leaveStatusHistory: []);
    }, (resp) {
      return LeaveStatusHistoryModel.fromJson(resp.data);
    });
    return model;
  }
}
