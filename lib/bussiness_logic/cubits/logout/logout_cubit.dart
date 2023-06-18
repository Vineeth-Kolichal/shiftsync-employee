import 'package:bloc/bloc.dart';
import 'package:shiftsync/data/data_providers/logout/logout.dart';
import 'package:shiftsync/data/models/logout_response_model/logout_response_model.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  Logout empLogout = Logout();
  LogoutCubit() : super(LogoutInitial());
  Future<void> logout() async {
    emit(LogoutLoading());
    LogoutResponseModel logoutResponseModel = await empLogout.employeeLogout();
    emit(LogoutResponseState(
        logoutResponseModel: logoutResponseModel, isLoading: false));
  }
}
