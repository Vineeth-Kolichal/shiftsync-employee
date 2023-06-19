import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';
import 'package:shiftsync/data/models/sign_up_otp_response_model/sign_up_otp_response_model.dart';
import 'package:shiftsync/util/cookie_handler/cookie_jar_object.dart';

class SignUpOtpProvider {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Future<SignUpOtpResponseModel> verifyOtp({required OtpModel otp}) async {
    //to use cookie form the signup respose
    dio.interceptors.add(CookieManager(cookieJar));
    try {
      final response = await dio.post(
        ApiEndPoints.signUpOtpPoint,
        data: {"otp": otp.otp},
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        //if otp verification successfull then this wil works
        return SignUpOtpResponseModel.fromJson(response.data);
      } else {
        //if any error
        return SignUpOtpResponseModel(message: 'Something Error', status: 404);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        //if any other error like cookie error, otp missmatch then this will works
        return SignUpOtpResponseModel(
            status: 500, message: e.response?.data['message']);
      } else if (e.response?.statusCode == 400) {
        return SignUpOtpResponseModel(
            status: 400, message: e.response?.data['message']);
      } else {
        //if any error
        return SignUpOtpResponseModel(message: 'Something Error', status: 404);
      }
    } catch (e) {
      //if any other error
      return SignUpOtpResponseModel(message: e.toString(), status: 404);
    }
  }
}
