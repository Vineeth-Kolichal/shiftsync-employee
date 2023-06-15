import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shiftsync/core/api_end_points/api_end_points.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/data/models/sign_up_model/sign_up.dart';
import 'package:shiftsync/data/models/sign_up_response_model/sign_up_response_model.dart';

class SignUpDataProvider {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
  Future<SignUpResponseModel> sinUp(SignUpModel signUpModel) async {
    //if server set any cookie cookiejar will handle it
    dio.interceptors.add(CookieManager(cookieJar));
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
        //if user is entered correct data and an otp send to their mobile number then return this
        return SignUpResponseModel.fromJson(response.data);
      } else {
        //if any error
        return SignUpResponseModel(status: 404, message: 'Something error');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        //if user is already exist the return this
        return SignUpResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      } else {
        //if any error
        return SignUpResponseModel(status: 404, message: 'Something error');
      }
    } catch (e) {
      //if any other error
      return SignUpResponseModel(status: 404, message: e.toString());
    }
  }
}
