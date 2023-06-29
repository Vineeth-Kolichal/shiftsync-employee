import 'package:dio/dio.dart';
import 'package:shiftsync/util/api_end_points/api_end_points.dart';
import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';
import 'package:shiftsync/data/models/sign_in_authentication_response_model/sign_in_authentication_response.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';
import 'package:shiftsync/util/dio_object/dio_module.dart';

class SignInDataProvider {
  Future<SignInAuthenticationResponseModel> signIn(
      SignInAuthenticationModel signInAuthenticationModel) async {
    Dio dio = locator<DioObject>().returnDioObject();
    try {
      final response = await dio.post(ApiEndPoints.signInPoint,
          data: signInAuthenticationModel.toJson());

      if (response.statusCode == 200) {
        //if authentication is successfull return response
        return SignInAuthenticationResponseModel.fromJson(response.data);
      } else {
        //if any error occured the return an error message
        return SignInAuthenticationResponseModel(
            data: [], errors: ['Something Error'], message: '', status: 404);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        //Return if username or password not correct
        return SignInAuthenticationResponseModel(
            status: e.response?.statusCode, errors: e.response?.data['errors']);
      } else {
        //if any error occured the return an error message
        return SignInAuthenticationResponseModel(
            data: [], errors: ['Something Error'], message: '', status: 404);
      }
    } catch (e) {
      //if any error occured the return an error message
      return SignInAuthenticationResponseModel(
          data: [], errors: ['Something Error'], message: '', status: 404);
    }
  }
}
