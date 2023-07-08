import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/data_providers/get_salary_details_api_provider/get_salary_api_provider.dart';
import 'package:shiftsync/data/models/salary_details_model/salary_details_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

@LazySingleton(as: GetSalaryDetailsRepository)
class SalaryDetaiilsRepo implements GetSalaryDetailsRepository {
  GetSalaryDetailsApiProvider apiProvider =
      getIt<GetSalaryDetailsApiProvider>();
  @override
  Future<SalaryDetailsModel> getSalaryDetails() async {
    final response = await apiProvider.getSalaryDetails();
    SalaryDetailsModel detailsModel = response.fold((msg) {
      return SalaryDetailsModel(
        status: 400,
        message: msg,
      );
    }, (resp) {
      return SalaryDetailsModel.fromJson(resp.data);
    });
    return detailsModel;
  }
}
