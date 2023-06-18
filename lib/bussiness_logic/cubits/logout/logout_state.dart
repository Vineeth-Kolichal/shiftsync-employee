part of 'logout_cubit.dart';

class LogoutState {
  final bool isLoading;
  LogoutState({required this.isLoading});
}

class LogoutInitial extends LogoutState {
  LogoutInitial() : super(isLoading: false);
}

class LogoutLoading extends LogoutState {
  LogoutLoading() : super(isLoading: true);
}

class LogoutResponseState extends LogoutState {
  final LogoutResponseModel logoutResponseModel;
  LogoutResponseState(
      {required this.logoutResponseModel, required super.isLoading});
}
