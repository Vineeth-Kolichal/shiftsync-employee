part of 'sign_in_bloc.dart';

class SignInState {
  final bool isLoading;
  SignInState({required this.isLoading});
}

class SignInInitial extends SignInState {
  SignInInitial() : super(isLoading: false);
}

class SignInLoading extends SignInState {
  SignInLoading() : super(isLoading: true);
}

class SignInResult extends SignInState {
  final SignInAuthenticationResponseModel signInAuthenticationResponseModel;
  SignInResult(
      {required this.signInAuthenticationResponseModel,
      required super.isLoading});
}
