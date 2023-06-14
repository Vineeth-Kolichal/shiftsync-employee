import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftsync/data/data_providers/sign_up_otp/sign_up_otp_provider.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';
import 'package:shiftsync/data/models/sign_up_otp_response_model/sign_up_otp_response_model.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  SignUpOtpProvider otpProvider = SignUpOtpProvider();
  OtpVerificationBloc() : super(OtpVerificationInitial()) {
    on<VerifySignUpOtp>((event, emit) async {
      emit(OtpVerificationLoadingState());
      SignUpOtpResponseModel responseModel =
          await otpProvider.verifyOtp(otp: event.otp);
      emit(OtpVerificationResponseState(
          signUpOtpResponseModel: responseModel, isLoading: false));
    });
  }
}
