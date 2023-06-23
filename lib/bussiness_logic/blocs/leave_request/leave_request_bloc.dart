import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'leave_request_event.dart';
part 'leave_request_state.dart';

class LeaveRequestBloc extends Bloc<LeaveRequestEvent, LeaveRequestState> {
  LeaveRequestBloc() : super(LeaveRequestInitial()) {
    on<LeaveRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
