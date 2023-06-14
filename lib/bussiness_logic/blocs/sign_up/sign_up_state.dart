part of 'sign_up_bloc.dart';

class SignUpState {
  final bool isLoading;
  SignUpState({required this.isLoading});
}

class SignUpInitial extends SignUpState {
  SignUpInitial() : super(isLoading: false);
}

class SignUpLoadingState extends SignUpState {
  SignUpLoadingState() : super(isLoading: true);
}

class SignUpResponseState extends SignUpState {
  final SignUpResponseModel signUpResponseModel;
  SignUpResponseState(
      {required this.signUpResponseModel, required super.isLoading});
}
