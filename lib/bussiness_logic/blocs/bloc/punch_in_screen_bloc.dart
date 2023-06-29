import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';

part 'punch_in_screen_event.dart';
part 'punch_in_screen_state.dart';
part 'punch_in_screen_bloc.freezed.dart';

@injectable
class PunchInScreenBloc extends Bloc<PunchInScreenEvent, PunchInScreenState> {
  GetDutyRepository getDutyRepository;
  PunchInScreenBloc(this.getDutyRepository)
      : super(PunchInScreenState.initial()) {
    // on<PunchInScreenEvent>((event, emit) {
    // });

    on<GetDuty>((event, emit) async {
      emit(
          const PunchInScreenState(allLoading: true, otpSendingLoading: false));
      GetDutyModel getDutyModel = await getDutyRepository.getDuty();
      final newState =
          state.copyWith(allLoading: false, dutymodel: getDutyModel);
      emit(newState);
      // emit(PunchInScreenState.dutyResponseState(getDutyModel: getDutyModel));
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
  }
}
