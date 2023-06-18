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

//to manage the password and confirm password in the signup screen
  void checkPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      //if password field is empty
      return emit(ConfirmPasswordState(status: 0));
    }
    if (pass == confirmPassword) {
      //if passwords are same
      return emit(ConfirmPasswordState(status: 1));
    } else {
      //if password are different
      return emit(ConfirmPasswordState(status: 2));
    }
  }
}
