part of 'confirm_password_cubit.dart';

class ConfirmPasswordState {
  final int status;

  ConfirmPasswordState({
    required this.status,
  });
}

class ConfirmPasswordInitial extends ConfirmPasswordState {
  ConfirmPasswordInitial() : super(status: 0);
}
