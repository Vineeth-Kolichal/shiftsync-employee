import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';
import 'package:shiftsync/util/dio_object/dio_object.dart';

class DutyApiProvider {
  Dio dio = locator<DioObject>().returnDioObject();
  Future<Either<String, Response>> getDutyDetailsFromApi() async {
    try {
      final response = await dio.get(ApiEndPoints.dutyEndPoint);
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
}
