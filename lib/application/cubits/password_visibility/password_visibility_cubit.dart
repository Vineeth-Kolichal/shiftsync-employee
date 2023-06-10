import 'package:bloc/bloc.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityInitial());
  void visiblepassword() {
    if (state.showPassword) {
     return  emit(PasswordVisibilityState(showPassword: false));
    } else {
     return  emit(PasswordVisibilityState(showPassword: true));
    }
  }
}
