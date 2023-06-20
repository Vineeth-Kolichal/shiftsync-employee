import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/util/cookie_handler/persist_cookiejar.dart';
import 'package:shiftsync/data/models/logout_response_model/logout_response_model.dart';

class Logout {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Future<LogoutResponseModel> employeeLogout() async {
    try {
      dio.interceptors.add(CookieManager(persistCookieJar));
      final response = await dio.get(ApiEndPoints.logoutPoint);
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
