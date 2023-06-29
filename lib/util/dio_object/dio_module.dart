import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/util/cookie_handler/persist_cookiejar.dart';
import 'package:injectable/injectable.dart';

class DioObject {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Dio returnDioObject() {
    dio.interceptors.add(CookieManager(persistCookieJar));
    return dio;
  }
}

@module
abstract class DioModule {
  @lazySingleton
  Dio get dioInstance => Dio(BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
      ));

  @lazySingleton
  CookieManager get cookieManager => CookieManager(persistCookieJar);
}
