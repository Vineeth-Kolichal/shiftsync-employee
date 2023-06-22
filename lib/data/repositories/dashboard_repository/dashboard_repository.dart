import 'package:shiftsync/data/data_providers/dashboard/dashboard_data_provider.dart';
import 'package:shiftsync/data/models/dashboard_model/dashboard_model.dart';

class DashboardRepository {
  DashboardDataProvider dashboardDataProvider = DashboardDataProvider();
  Future<DashboardModel> dashboardData() async {
    final response = await dashboardDataProvider.getDashboradData();

    final DashboardModel result = response.fold(
        (l) => DashboardModel.fromJson(l.data),
        (r) => DashboardModel(status: 404, message: r));
    return result;
  }
}
