
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shiftsync/core/api_end_points/api_end_points.dart';
import 'package:shiftsync/core/api_response_type/api_respose_result_type.dart';

import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';

class SignInDataProvider {
  Future<Either<ApiResponseResultType, dynamic>> signIn(
      SignInAuthenticationModel signInAuthenticationModel) async {
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    try {
      final response = await dio.post(
        signInPoint,
        data: {
          "username": signInAuthenticationModel.username,
          "password": signInAuthenticationModel.password
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return left(ApiResponseResultType.clientError);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Left(ApiResponseResultType.clientError);
      } else {
        return const Left(ApiResponseResultType.serverError);
      }
    } catch (e) {
      return const Left(ApiResponseResultType.clientError);
    }
  }
}
