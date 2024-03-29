part of 'dashboard_bloc.dart';

class DashboardState {
  final bool isLoading;

  DashboardState({required this.isLoading});
}

class DashboardInitial extends DashboardState {
  DashboardInitial() : super(isLoading: true);
}

class DashboardLoading extends DashboardState {
  DashboardLoading() : super(isLoading: true);
}

class DashboardResponseState extends DashboardState {
  final DashboardModel dashboardModel;
  final GetDutyModel duty;
  final SalaryDetailsModel salaryDetailsModel;
  DashboardResponseState({
    required this.salaryDetailsModel,
    required this.dashboardModel,
    required super.isLoading,
    required this.duty,
  });
}
