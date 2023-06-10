part of 'password_visibility_cubit.dart';

class PasswordVisibilityState {
  final bool showPassword;

  PasswordVisibilityState({required this.showPassword});
}

class PasswordVisibilityInitial extends PasswordVisibilityState {
  PasswordVisibilityInitial() : super(showPassword: true);
}
