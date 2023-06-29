import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';

@injectable
class DutyApiProvider {
  final Dio _dio;
  final CookieManager _cookieManager;
  DutyApiProvider(this._dio, this._cookieManager);
  Future<Either<String, Response>> getDutyDetailsFromApi() async {
    _dio.interceptors.add(_cookieManager);
    try {
      final response = await _dio.get(ApiEndPoints.dutyEndPoint);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return const Left('Something error 1');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return Right(e.response!);
      } else {
        return const Left('Something error2');
      }
    } catch (e) {
      return const Left('Something error 3');
    }
  }

  Future<bool> getOtpForPunchIn() async {
    _dio.interceptors.add(_cookieManager);
    try {
      final response = await _dio.get(ApiEndPoints.punchInOtp);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
