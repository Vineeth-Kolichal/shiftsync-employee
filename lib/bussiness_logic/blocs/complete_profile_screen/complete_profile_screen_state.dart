part of 'complete_profile_screen_bloc.dart';

class CompleteProfileScreenState {
  final bool isLoading;
  CompleteProfileScreenState({this.isLoading = false});
}

class CompleteProfileScreenInitial extends CompleteProfileScreenState {}

class GenderChangeState extends CompleteProfileScreenState {
  final Gender gender;
  GenderChangeState({required this.gender});
}

class MaritalStatusChangeState extends CompleteProfileScreenState {
  final MaritalStatus maritalStatus;
  MaritalStatusChangeState({required this.maritalStatus});
}

class ProfileFormSubmitLoading extends CompleteProfileScreenState {
  ProfileFormSubmitLoading() : super(isLoading: true);
}

class ProfileFormSubmitRespState extends CompleteProfileScreenState {
  final ProfileFormResponseModel profileFormResponseModel;
  ProfileFormSubmitRespState(
      {required this.profileFormResponseModel, required super.isLoading});
}
