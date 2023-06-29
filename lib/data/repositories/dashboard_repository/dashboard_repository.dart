import 'package:shiftsync/data/data_providers/dashboard/dashboard_data_provider.dart';
import 'package:shiftsync/data/models/dashboard_model/dashboard_model.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

class DashboardRepository {
  DashboardDataProvider dashboardDataProvider = getIt<DashboardDataProvider>();
  Future<DashboardModel> dashboardData() async {
    final response = await dashboardDataProvider.getDashboradData();

    final DashboardModel result = response.fold(
        (resp) => DashboardModel.fromJson(resp.data),
        (r) => DashboardModel(status: 404, message: r));
    return result;
  }
}
