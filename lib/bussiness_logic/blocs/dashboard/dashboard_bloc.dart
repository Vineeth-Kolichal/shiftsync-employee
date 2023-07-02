import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/dashboard_model/dashboard_model.dart';
import 'package:shiftsync/data/models/get_duty_model/get_duty_model.dart';
import 'package:shiftsync/data/repositories/dashboard_repository/dashboard_repository.dart';
import 'package:shiftsync/data/repositories/repositories.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardRepository dashboardRepository = DashboardRepository();
  GetDutyRepository getDutyRepository;
  DashboardBloc(this.getDutyRepository) : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      emit(DashboardLoading());
      DashboardModel dashboardModel = await dashboardRepository.dashboardData();
      GetDutyModel dutyModel = await getDutyRepository.getDuty();
      emit(DashboardResponseState(
          dashboardModel: dashboardModel, isLoading: false, duty: dutyModel));
    });
  }
}
