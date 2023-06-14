
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftsync/core/api_response_type/api_respose_result_type.dart';
import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';
import 'package:shiftsync/data/repositories/sign_in_repository/sign_in_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInRepository signInRepository = SignInRepository();
  SignInBloc() : super(SignInInitial()) {
    on<EmployeeSignIn>((event, emit) async {
      emit(SignInLoading());
      final response = await signInRepository
          .employeeSignIn(event.signInAuthenticationModel);
      emit(SignInResult(responseType: response));
    });
  }
}