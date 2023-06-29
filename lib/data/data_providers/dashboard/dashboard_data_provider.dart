import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';

@injectable
class DashboardDataProvider {
  final Dio _dio;
  final CookieManager _cookieManager;
  DashboardDataProvider(this._dio, this._cookieManager);
  Future<Either<Response<dynamic>, String>> getDashboradData() async {
    try {
      _dio.interceptors.add(_cookieManager);
      final response = await _dio.get(ApiEndPoints.dashboardPoint);
      if (response.statusCode == 200) {
        return Left(response);
      } else {
        return const Right('Something Error!');
      }
    } on DioException catch (e) {
      log(e.response.toString());
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
