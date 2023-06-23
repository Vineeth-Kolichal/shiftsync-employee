import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/data/models/leave_request_model/leave_request_model.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/util/cookie_handler/persist_cookiejar.dart';

class LeaveRequestApi {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Future<Either<String, Response>> submitApplication(
      LeaveRequestModel leaveRequestModel) async {
    try {
      dio.interceptors.add(CookieManager(persistCookieJar));
      final response = await dio.post(ApiEndPoints.leaveRequestPoint,
          data: leaveRequestModel.toJson());
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return const Left('Error occured');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422 || e.response?.statusCode == 400) {
        return Right(e.response!);
      } else {
        return const Left('Error occured');
      }
    } catch (e) {
      return const Left('Error occured');
    }
  }
}
