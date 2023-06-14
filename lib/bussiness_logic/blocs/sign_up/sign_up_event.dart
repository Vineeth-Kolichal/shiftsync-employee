part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpLoading extends SignUpEvent {}

class EmployeeSignUp extends SignUpEvent {
  final SignUpModel signUpModel;
  EmployeeSignUp({required this.signUpModel});
}
