part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class EmployeeSignIn extends SignInEvent {
  final SignInAuthenticationModel signInAuthenticationModel;
  EmployeeSignIn({required this.signInAuthenticationModel});
}
