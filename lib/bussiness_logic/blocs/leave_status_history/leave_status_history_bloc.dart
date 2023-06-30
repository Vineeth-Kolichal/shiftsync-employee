import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/leave_status_history_model/leave_status_history_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';

part 'leave_status_history_event.dart';
part 'leave_status_history_state.dart';
part 'leave_status_history_bloc.freezed.dart';

@injectable
class LeaveStatusHistoryBloc
    extends Bloc<LeaveStatusHistoryEvent, LeaveStatusHistoryState> {
  GetLeaveStatusHistoryRepository repository;
  LeaveStatusHistoryBloc(this.repository)
      : super(LeaveStatusHistoryState.initial()) {
    on<LeaveStatusHistoryEvent>((event, emit) async {
      emit(LeaveStatusHistoryState.initial());
      LeaveStatusHistoryModel model = await repository.getLeaveStatusHistory();
      emit(state.copyWith(isLoading: false, lshModel: model));
    });
  }
}
