import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftsync/data/data_providers/sign_up/sign_up_data_provider.dart';
import 'package:shiftsync/data/models/sign_up_model/sign_up.dart';
import 'package:shiftsync/data/models/sign_up_response_model/sign_up_response_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpDataProvider signUpDataProvider = SignUpDataProvider();
  SignUpBloc() : super(SignUpInitial()) {
    on<EmployeeSignUp>((event, emit) async {
      emit(SignUpLoadingState());
      SignUpResponseModel response =
          await signUpDataProvider.sinUp(event.signUpModel);
      emit(
          SignUpResponseState(signUpResponseModel: response, isLoading: false));
    });
  }
}
