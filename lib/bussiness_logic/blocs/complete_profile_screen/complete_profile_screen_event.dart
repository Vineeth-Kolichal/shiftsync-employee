part of 'complete_profile_screen_bloc.dart';

class CompleteProfileScreenEvent {
 
}

class GenderChangeEvent extends CompleteProfileScreenEvent {
  final Gender gender;
  GenderChangeEvent({required this.gender});
}

class MaritalStatusChangeEvent extends CompleteProfileScreenEvent {
  final MaritalStatus maritalStatus;
  MaritalStatusChangeEvent({required this.maritalStatus});
}

class ProfileFormSubmitEvent extends CompleteProfileScreenEvent {
  final ProfileFormModel profileFormModel;
  ProfileFormSubmitEvent({required this.profileFormModel,});
}
