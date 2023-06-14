part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInResult extends SignInState {
  final ApiResponseResultType responseType;
  SignInResult({required this.responseType});
}
