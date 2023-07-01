
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';

@injectable
class AttendenceApiProvider {
  final Dio dio;
  final CookieManager cookieManager;
  AttendenceApiProvider(this.dio, this.cookieManager);
  Future<Either<String, Response>> getAllAttendenceDetails() async {
    dio.interceptors.add(cookieManager);
    try {
      final response = await dio.get(ApiEndPoints.attendence);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return const Left('Something error1');
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        return Right(e.response!);
      } else {
        return const Left('Something Error2');
      }
    } catch (e) {
      return const Left('Something Error3');
    }
  }
}
