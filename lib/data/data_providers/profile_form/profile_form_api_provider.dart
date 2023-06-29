import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/profile_form_model/profile_form_model.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';

@injectable
class ProfileFormApiProvider {
  final Dio _dio;
  final CookieManager _cookieManager;

  ProfileFormApiProvider(this._dio, this._cookieManager);
  Future<Either<String, Response>> submitProfileForm(
      ProfileFormModel profileFormModel) async {
    _dio.interceptors.add(_cookieManager);
    try {
      final response = await _dio.post(ApiEndPoints.formSubmitPoint,
          data: profileFormModel.toJson());
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(response);
      } else {
        return const Left('Something Error');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return Right(e.response!);
      } else {
        return const Left('Something Error');
      }
    } catch (e) {
      return const Left('Something error');
    }
  }
}
