import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/util/cookie_handler/persist_cookiejar.dart';

class DashboardDataProvider {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Future<Either<Response<dynamic>, String>> getDashboradData() async {
    dio.interceptors.add(CookieManager(persistCookieJar));

    try {
      dio.interceptors.add(CookieManager(persistCookieJar));
      final response = await dio.get(ApiEndPoints.dashboardPoint);
      if (response.statusCode == 200) {
        return Left(response);
      } else {
        return const Right('Something Error!');
      }
    } on DioException catch (e) {
      if ((e.response?.statusCode == 400 || e.response?.statusCode == 401) &&
          e.response != null) {
        return Left(e.response!);
      } else {
        return const Right('Something Error!');
      }
    } catch (_) {
      log('message');
      return const Right('Something Error!');
    }
  }
}
