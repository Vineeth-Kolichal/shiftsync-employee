import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/data_providers/attendence_api_provider/attendence_api_provider.dart';
import 'package:shiftsync/data/models/attendence_model/attendence_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

@LazySingleton(as: AttendenceRepository)
class AttendenceRepoImplementation extends AttendenceRepository {
  AttendenceApiProvider attendenceApiProvider = getIt<AttendenceApiProvider>();
  @override
  Future<AttendenceModel> getAttendence() async {
    final response = await attendenceApiProvider.getAllAttendenceDetails();
    AttendenceModel attendenceModel = response.fold((msg) {
      return AttendenceModel(attendance: [], status: 400);
    }, (resp) {
      return AttendenceModel.fromJson(resp.data);
    });
    return attendenceModel;
  }
}
