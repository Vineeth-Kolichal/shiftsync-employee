import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';

@injectable
class SalaryHistoryApiProvider {
  final Dio dio;
  final CookieManager cookieManager;

  SalaryHistoryApiProvider(this.dio, this.cookieManager);
  Future<Either<String, Response>> getSalaryHistory() async {
    dio.interceptors.add(cookieManager);
    try {
      final response = await dio.get(ApiEndPoints.salaryHistory);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return const Left('Something went wrong');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Right(e.response!);
      } else {
        return const Left('Something went wrong2');
      }
    } catch (e) {
      return const Left('Something went wrong3');
    }
  }
}
