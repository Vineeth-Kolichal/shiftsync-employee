import 'package:dio/dio.dart';
import 'package:shiftsync/core/api_end_points/api_end_points.dart';

import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';
import 'package:shiftsync/data/models/sign_in_authentication_response_model/sign_in_authentication_response.dart';

class SignInDataProvider {
  Future<SignInAuthenticationResponseModel> signIn(
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
        return SignInAuthenticationResponseModel.fromJson(response.data);
      } else {
        return SignInAuthenticationResponseModel(
            data: '', errors: ['Something Error'], message: '', status: 404);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return SignInAuthenticationResponseModel(
            status: e.response?.statusCode, errors: e.response?.data['errors']);
      } else {
        return SignInAuthenticationResponseModel(
            data: '', errors: ['Something Error'], message: '', status: 404);
      }
    } catch (e) {
      return SignInAuthenticationResponseModel(
          data: '', errors: ['Something Error'], message: '', status: 404);
    }
  }
}
