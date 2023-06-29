import 'package:shiftsync/data/data_providers/profile_form/profile_form_api_provider.dart';
import 'package:shiftsync/data/models/profile_form_model/profile_form_model.dart';
import 'package:shiftsync/data/models/profile_form_response_model/profile_form_response_model.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

class ProfileFormRepository {
  ProfileFormApiProvider profileFormApiProvider =
      getIt<ProfileFormApiProvider>();
  Future<ProfileFormResponseModel> profileFormSubmit(
      {required ProfileFormModel profileForm}) async {
    final response =
        await profileFormApiProvider.submitProfileForm(profileForm);
    final result = response.fold((msg) {
      return ProfileFormResponseModel(status: 404, message: msg, errors: [msg]);
    }, (resp) {
      return ProfileFormResponseModel.fromJson(resp.data);
    });
    return result;
  }
}
