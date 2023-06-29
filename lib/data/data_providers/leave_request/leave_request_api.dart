import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/leave_request_model/leave_request_model.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
@injectable
class LeaveRequestApi {
  final Dio _dio;
  final CookieManager _cookieManager;

  LeaveRequestApi(this._dio, this._cookieManager);
  Future<Either<String, Response>> submitApplication(
      LeaveRequestModel leaveRequestModel) async {
    _dio.interceptors.add(_cookieManager);
    try {
      final response = await _dio.post(ApiEndPoints.leaveRequestPoint,
          data: leaveRequestModel.toJson());
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return const Left('Error occured1');
      }
    } on DioException catch (e) {
      log(e.toString());
      if (e.response?.statusCode == 422 || e.response?.statusCode == 400) {
        return Right(e.response!);
      } else {
        return Left(e.response!.statusCode.toString());
      }
    } catch (e) {
      return const Left('Error occured3');
    }
  }
}
