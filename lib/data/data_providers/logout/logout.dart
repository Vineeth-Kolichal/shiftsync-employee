import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/data/models/logout_response_model/logout_response_model.dart';

@injectable
class Logout {
  final Dio _dio;
  final CookieManager _cookieManager;

  Logout(this._dio, this._cookieManager);
  Future<LogoutResponseModel> employeeLogout() async {
    _dio.interceptors.add(_cookieManager);
    try {
      final response = await _dio.get(ApiEndPoints.logoutPoint);
      if (response.statusCode == 401) {}
      if (response.statusCode == 200) {
        return LogoutResponseModel.fromJson(response.data);
      } else {
        return LogoutResponseModel(message: 'Something error', status: 404);
      }
    } on DioException catch (e) {
      log(e.response.toString());
      return LogoutResponseModel(message: 'Something error', status: 401);
    } catch (e) {
      return LogoutResponseModel(message: 'Something Error', status: 401);
    }
  }
}
