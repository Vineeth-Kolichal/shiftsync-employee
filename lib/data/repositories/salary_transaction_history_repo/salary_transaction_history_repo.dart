import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/data_providers/salary_history_api_provider/salary_history_api_provider.dart';
import 'package:shiftsync/data/models/salary_history_model/salary_history_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

@LazySingleton(as: SalaryTransactionHistoryRepository)
class SalaryHistoryRepo implements SalaryTransactionHistoryRepository {
  SalaryHistoryApiProvider apiProvider = getIt<SalaryHistoryApiProvider>();
  @override
  Future<SalaryHistoryModel> getSalaryTransactionHistory() async {
    final response = await apiProvider.getSalaryHistory();
    SalaryHistoryModel historyModel = response.fold((msg) {
      return SalaryHistoryModel(message: msg, status: 400, salaryHistory: []);
    }, (resp) {
      return SalaryHistoryModel.fromJson(resp.data);
    });
    return historyModel;
  }
}
