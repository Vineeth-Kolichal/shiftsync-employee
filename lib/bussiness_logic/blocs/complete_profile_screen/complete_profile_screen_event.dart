part of 'complete_profile_screen_bloc.dart';

@immutable
abstract class CompleteProfileScreenEvent {}

class GenderChangeEvent extends CompleteProfileScreenEvent {
  final Gender gender;
  GenderChangeEvent({required this.gender});
}

class MaritalStatusChangeEvent extends CompleteProfileScreenEvent {
  final MaritalStatus maritalStatus;
  MaritalStatusChangeEvent({required this.maritalStatus});
}

class UploadImageEvent extends CompleteProfileScreenEvent {}
