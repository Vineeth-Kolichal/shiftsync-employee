import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/core/constants/shared_preference_key_names.dart';
import 'package:shiftsync/data/data_providers/sign_in/sign_in_data_provider.dart';
import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';
import 'package:shiftsync/data/models/sign_in_authentication_response_model/sign_in_authentication_response.dart';

class SignInRepository {
  SignInDataProvider signInDataProvider = SignInDataProvider();
  Future<SignInAuthenticationResponseModel> employeeSignIn(
      SignInAuthenticationModel signInAuthenticationModel) async {
    SignInAuthenticationResponseModel response =
        await signInDataProvider.signIn(signInAuthenticationModel);
    if (response.status == 200) {
      //if successfull login ,then cookie value store to shared preference to control the navigations
      // SharedPreferences shared = await SharedPreferences.getInstance();
      // await shared.setString(cookie, response.data!);
    }
    return response;
  }
}
