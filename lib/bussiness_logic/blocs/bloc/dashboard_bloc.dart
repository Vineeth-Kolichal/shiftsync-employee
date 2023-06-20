import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftsync/data/models/dashboard_model/dashboard_model.dart';
import 'package:shiftsync/data/repositories/dashboard_repository/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardRepository dashboardRepository = DashboardRepository();
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      emit(DashboardLoading());
      DashboardModel dashboardModel = await dashboardRepository.dashboardData();
      emit(DashboardResponseState(
          dashboardModel: dashboardModel, isLoading: false));
    });
  }
}
