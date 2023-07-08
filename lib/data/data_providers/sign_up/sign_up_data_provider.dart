import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/data/models/sign_up_model/sign_up.dart';
import 'package:shiftsync/data/models/sign_up_response_model/sign_up_response_model.dart';
import 'package:shiftsync/util/cookie_handler/cookie_jar_object.dart';

class SignUpDataProvider {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Future<SignUpResponseModel> sinUp(SignUpModel signUpModel) async {
    //if server set any cookie cookiejar will handle it
    dio.interceptors.add(CookieManager(cookieJar));
    try {
      final response =
          await dio.post(ApiEndPoints.singUpPoint, data: signUpModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        //if user is entered correct data and an otp send to their mobile number then return this
        return SignUpResponseModel.fromJson(response.data);
      } else {
        //if any error
        return SignUpResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      log(e.toString());
      if (e.response?.statusCode == 400) {
        //if user is already exist the return this
        return SignUpResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      } else {
        //if any error
        return SignUpResponseModel(status: 404, message: 'Something error2');
      }
    } catch (e) {
      //if any other error
      return SignUpResponseModel(status: 404, message: e.toString());
    }
  }
}
