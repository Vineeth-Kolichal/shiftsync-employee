import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';
import 'package:shiftsync/data/repositories/repositories.dart';
import 'package:shiftsync/util/constants/shared_preference_key_names.dart';

part 'punch_in_screen_event.dart';
part 'punch_in_screen_state.dart';
part 'punch_in_screen_bloc.freezed.dart';

@injectable
class PunchInScreenBloc extends Bloc<PunchInScreenEvent, PunchInScreenState> {
  GetDutyRepository getDutyRepository;
  PunchInScreenBloc(this.getDutyRepository)
      : super(PunchInScreenState.initial()) {
    on<GetDuty>((event, emit) async {
      bool isPunchedIn = false;
      SharedPreferences shared = await SharedPreferences.getInstance();
      final sharedValue = shared.getBool(punchIn);
      if (sharedValue != null && sharedValue) {
        isPunchedIn = sharedValue;
      }
      emit(PunchInScreenState(
          allLoading: true,
          otpSendingLoading: false,
          punchInStatus: isPunchedIn));
      GetDutyModel getDutyModel = await getDutyRepository.getDuty();
      final newState =
          state.copyWith(allLoading: false, dutymodel: getDutyModel);
      emit(newState);
    });
    on<SendOtp>((event, emit) async {
      emit(state.copyWith(
        allLoading: false,
        otpSendingLoading: true,
      ));
      bool isSend = await getDutyRepository.sendOtp();
      final newState = state.copyWith(
          allLoading: false, otpSendingLoading: false, isSend: isSend);
      emit(newState);
    });

    on<VerifyOtp>((event, emit) async {
      SharedPreferences shared = await SharedPreferences.getInstance();

      bool otpVerificationStatus =
          await getDutyRepository.veryfyOtp(otp: event.otp);
      if (otpVerificationStatus) {
        shared.setBool(punchIn, true);
      }
      final newState =
          state.copyWith(isOtpVerified: otpVerificationStatus, isSend: null);
      emit(newState);
    });

    on<PunchOut>((event, emit) async {
      SharedPreferences shared = await SharedPreferences.getInstance();
      bool response = await getDutyRepository.punchOut();
      if (response) {
        shared.remove(punchIn);
        emit(state.copyWith(punchInStatus: false));
      }
    });
  }
}
