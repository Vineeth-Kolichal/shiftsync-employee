import 'dart:developer';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/core/api_end_points/api_end_points.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';
import 'package:shiftsync/data/models/sign_up_otp_response_model/sign_up_otp_response_model.dart';

class SignUpOtpProvider {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
  Future<SignUpOtpResponseModel> verifyOtp({required OtpModel otp}) async {
   
    dio.interceptors.add(CookieManager(cookieJar));
    try {
      final response = await dio.post(
        signUpOtpPoint,
        data: {"otp": otp.otp},
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return SignUpOtpResponseModel.fromJson(response.data);
      } else {
        return SignUpOtpResponseModel(message: 'Something Error', status: 404);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        return SignUpOtpResponseModel(
            status: 500, message: e.response?.data['message']);
      } else if (e.response?.statusCode == 400) {
        return SignUpOtpResponseModel(
            status: 400, message: e.response?.data['message']);
      } else {
        log(e.toString());
        return SignUpOtpResponseModel(message: 'Something Error', status: 404);
      }
    } catch (e) {
      return SignUpOtpResponseModel(message: e.toString(), status: 404);
    }
  }
}
