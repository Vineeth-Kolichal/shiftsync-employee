import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/attendence_model/attendance.dart';
import 'package:shiftsync/data/models/attendence_model/attendence_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';

part 'attendence_event.dart';
part 'attendence_state.dart';
part 'attendence_bloc.freezed.dart';

@injectable
class AttendenceBloc extends Bloc<AttendenceEvent, AttendenceState> {
  AttendenceRepository repository;
  AttendenceBloc(this.repository) : super(AttendenceState.loading()) {
    on<GetAttendence>((event, emit) async {
      emit(AttendenceState.loading());

      AttendenceModel attendenceModel = await repository.getAttendence();

      if (attendenceModel.status == 400) {
        return emit(state
            .copyWith(attendenceList: [], hasError: true, isLoading: false));
      } else {
        return emit(state.copyWith(
            attendenceList: attendenceModel.attendance ?? [],
            hasError: false,
            isLoading: false));
      }
    });
  }
}
