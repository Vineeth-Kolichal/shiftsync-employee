part of 'complete_profile_screen_bloc.dart';

@immutable
abstract class CompleteProfileScreenState {}

class CompleteProfileScreenInitial extends CompleteProfileScreenState {}

class GenderChangeState extends CompleteProfileScreenState {
  final Gender gender;
  GenderChangeState({required this.gender});
}

class MaritalStatusChangeState extends CompleteProfileScreenState {
  final MaritalStatus maritalStatus;
  MaritalStatusChangeState({required this.maritalStatus});
}
