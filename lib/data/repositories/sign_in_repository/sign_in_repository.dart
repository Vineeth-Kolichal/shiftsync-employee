
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/core/constants/shared_preference_key_names.dart';
import 'package:shiftsync/core/api_response_type/api_respose_result_type.dart';
import 'package:shiftsync/data/data_providers/sign_in/sign_in_data_provider.dart';
import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';
import 'package:shiftsync/data/models/sign_in_authentication_response_model/sign_in_authentication_response.dart';

class SignInRepository {
  SignInDataProvider signInDataProvider = SignInDataProvider();
  Future<ApiResponseResultType> employeeSignIn(
      SignInAuthenticationModel signInAuthenticationModel) async {
    final response = await signInDataProvider.signIn(signInAuthenticationModel);
    final result = response.fold((l) => l, (r) => r);
    if (result.runtimeType != ApiResponseResultType) {
      SignInAuthenticationResponseModel signInAuthenticationResponseModel =
          SignInAuthenticationResponseModel.fromJson(result);
      if (signInAuthenticationResponseModel.status == 200) {
        SharedPreferences shared = await SharedPreferences.getInstance();
        await shared.setString(cookie, signInAuthenticationResponseModel.data!);
      }
      return ApiResponseResultType.success;
    } else {
      return result;
    }
  }
}
