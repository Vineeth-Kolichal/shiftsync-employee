import 'package:bloc/bloc.dart';

part 'confirm_password_state.dart';

class ConfirmPasswordCubit extends Cubit<ConfirmPasswordState> {
  ConfirmPasswordCubit() : super(ConfirmPasswordInitial());
  String pass = '';
  void setpasswordState(String? password) {
    if (password == null || password.isEmpty) {
      return emit(ConfirmPasswordState(status: 0));
    }
    pass = password;
  }

  void checkPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return emit(ConfirmPasswordState(status: 0));
    }
    if (pass == confirmPassword) {
      return emit(ConfirmPasswordState(status: 1));
    } else {
      return emit(ConfirmPasswordState(status: 2));
    }
  }
}
