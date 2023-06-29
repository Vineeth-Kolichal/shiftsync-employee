import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftsync/data/data_providers/sign_in/sign_in_data_provider.dart';
import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';
import 'package:shiftsync/data/models/sign_in_authentication_response_model/sign_in_authentication_response.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInDataProvider signInDataProvider = getIt<SignInDataProvider>();
  SignInBloc() : super(SignInInitial()) {
    on<EmployeeSignIn>((event, emit) async {
      //send loading state to ui
      emit(SignInLoading());
      //communicate with server through  data providers
      final response =
          await signInDataProvider.signIn(event.signInAuthenticationModel);

      //emit response state to ui
      emit(SignInResult(
          signInAuthenticationResponseModel: response, isLoading: false));
    });
  }
}
