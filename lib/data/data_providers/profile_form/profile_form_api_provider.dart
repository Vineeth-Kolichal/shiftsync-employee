import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shiftsync/data/models/profile_form_model/profile_form_model.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';
import 'package:shiftsync/util/dio_object/dio_object.dart';

class ProfileFormApiProvider {
  Dio dio = locator<DioObject>().returnDioObject();
  Future<Either<String, Response>> submitProfileForm(
      ProfileFormModel profileFormModel) async {
    try {
      final response = await dio.post(ApiEndPoints.formSubmitPoint,
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
