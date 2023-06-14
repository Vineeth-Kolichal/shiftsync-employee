import 'package:dio/dio.dart';
import 'package:shiftsync/core/api_end_points/api_end_points.dart';
import 'package:shiftsync/data/models/sign_up_model/sign_up.dart';
import 'package:shiftsync/data/models/sign_up_response_model/sign_up_response_model.dart';

class SignUpDataProvider {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
  Future<SignUpResponseModel> sinUp(SignUpModel signUpModel) async {
    try {
      final response = await dio.post(singUpPoint, data: {
        "firstname": signUpModel.firstname,
        "lastname": signUpModel.lastname,
        "email": signUpModel.email,
        "phone": signUpModel.phone,
        "username": signUpModel.username,
        "password": signUpModel.password
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SignUpResponseModel.fromJson(response.data);
      } else {
        return SignUpResponseModel(status: 404, message: 'Something error');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return SignUpResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      } else {
        return SignUpResponseModel(status: 404, message: 'Something error');
      }
    } catch (e) {
      return SignUpResponseModel(status: 404, message: e.toString());
    }
  }
}
