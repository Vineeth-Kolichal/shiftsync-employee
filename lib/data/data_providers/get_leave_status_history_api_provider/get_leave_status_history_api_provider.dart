import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';

@injectable
class GetLeaveStatusHistoryApiProvider {
  final Dio dio;
  final CookieManager cookieManager;
  GetLeaveStatusHistoryApiProvider(this.dio, this.cookieManager);
  Future<Either<int, Response>> getLeaveDataFromApi() async {
    dio.interceptors.add(cookieManager);
    try {
      final response = await dio.get(ApiEndPoints.leaveStatus);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return const Left(404);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return Right(e.response!);
      } else {
        return const Left(404);
      }
    } catch (e) {
      return const Left(404);
    }
  }
}
