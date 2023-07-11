// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:dio_cookie_manager/dio_cookie_manager.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shiftsync/bussiness_logic/blocs/attendence/attendence_bloc.dart'
    as _i24;
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart'
    as _i5;
import 'package:shiftsync/bussiness_logic/blocs/dashboard/dashboard_bloc.dart'
    as _i25;
import 'package:shiftsync/bussiness_logic/blocs/leave_status_history/leave_status_history_bloc.dart'
    as _i15;
import 'package:shiftsync/bussiness_logic/blocs/punch_in_screen_bloc/punch_in_screen_bloc.dart'
    as _i18;
import 'package:shiftsync/bussiness_logic/blocs/salary_details_page/salary_details_page_bloc.dart'
    as _i19;
import 'package:shiftsync/bussiness_logic/blocs/salary_transaction_history/salary_transaction_history_bloc.dart'
    as _i27;
import 'package:shiftsync/data/data_providers/attendence_api_provider/attendence_api_provider.dart'
    as _i23;
import 'package:shiftsync/data/data_providers/dashboard/dashboard_data_provider.dart'
    as _i26;
import 'package:shiftsync/data/data_providers/duty_apr_provider/duty_api_provider.dart'
    as _i8;
import 'package:shiftsync/data/data_providers/get_leave_status_history_api_provider/get_leave_status_history_api_provider.dart'
    as _i10;
import 'package:shiftsync/data/data_providers/get_salary_details_api_provider/get_salary_api_provider.dart'
    as _i12;
import 'package:shiftsync/data/data_providers/leave_request/leave_request_api.dart'
    as _i14;
import 'package:shiftsync/data/data_providers/logout/logout.dart' as _i16;
import 'package:shiftsync/data/data_providers/profile_form/profile_form_api_provider.dart'
    as _i17;
import 'package:shiftsync/data/data_providers/salary_history_api_provider/salary_history_api_provider.dart'
    as _i20;
import 'package:shiftsync/data/data_providers/sign_in/sign_in_data_provider.dart'
    as _i22;
import 'package:shiftsync/data/repositories/attendence_repo_implementation/attendence_repo_implementation.dart'
    as _i4;
import 'package:shiftsync/data/repositories/get_duty_repository/get_duty_repo_implementation.dart'
    as _i9;
import 'package:shiftsync/data/repositories/get_leave_history_repo/get_leave_history_repo.dart'
    as _i11;
import 'package:shiftsync/data/repositories/get_salary_details_repo/get_salary_details_repo.dart'
    as _i13;
import 'package:shiftsync/data/repositories/repositories.dart' as _i3;
import 'package:shiftsync/data/repositories/salary_transaction_history_repo/salary_transaction_history_repo.dart'
    as _i21;
import 'package:shiftsync/util/dio_module/dio_module.dart' as _i28;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i3.AttendenceRepository>(
        () => _i4.AttendenceRepoImplementation());
    gh.factory<_i5.CompleteProfileScreenBloc>(
        () => _i5.CompleteProfileScreenBloc());
    gh.lazySingleton<_i6.CookieManager>(() => dioModule.cookieManager);
    gh.lazySingleton<_i7.Dio>(() => dioModule.dioInstance);
    gh.factory<_i8.DutyApiProvider>(() => _i8.DutyApiProvider(
          gh<_i7.Dio>(),
          gh<_i6.CookieManager>(),
        ));
    gh.lazySingleton<_i3.GetDutyRepository>(
        () => _i9.GetDutyRepoImplementation());
    gh.factory<_i10.GetLeaveStatusHistoryApiProvider>(
        () => _i10.GetLeaveStatusHistoryApiProvider(
              gh<_i7.Dio>(),
              gh<_i6.CookieManager>(),
            ));
    gh.lazySingleton<_i3.GetLeaveStatusHistoryRepository>(
        () => _i11.GetLeaveHistoryRepoImplementation());
    gh.factory<_i12.GetSalaryDetailsApiProvider>(
        () => _i12.GetSalaryDetailsApiProvider(
              gh<_i7.Dio>(),
              gh<_i6.CookieManager>(),
            ));
    gh.lazySingleton<_i3.GetSalaryDetailsRepository>(
        () => _i13.SalaryDetaiilsRepo());
    gh.factory<_i14.LeaveRequestApi>(() => _i14.LeaveRequestApi(
          gh<_i7.Dio>(),
          gh<_i6.CookieManager>(),
        ));
    gh.factory<_i15.LeaveStatusHistoryBloc>(() =>
        _i15.LeaveStatusHistoryBloc(gh<_i3.GetLeaveStatusHistoryRepository>()));
    gh.factory<_i16.Logout>(() => _i16.Logout(
          gh<_i7.Dio>(),
          gh<_i6.CookieManager>(),
        ));
    gh.factory<_i17.ProfileFormApiProvider>(() => _i17.ProfileFormApiProvider(
          gh<_i7.Dio>(),
          gh<_i6.CookieManager>(),
        ));
    gh.factory<_i18.PunchInScreenBloc>(
        () => _i18.PunchInScreenBloc(gh<_i3.GetDutyRepository>()));
    gh.factory<_i19.SalaryDetailsPageBloc>(
        () => _i19.SalaryDetailsPageBloc(gh<_i3.GetSalaryDetailsRepository>()));
    gh.factory<_i20.SalaryHistoryApiProvider>(
        () => _i20.SalaryHistoryApiProvider(
              gh<_i7.Dio>(),
              gh<_i6.CookieManager>(),
            ));
    gh.lazySingleton<_i3.SalaryTransactionHistoryRepository>(
        () => _i21.SalaryHistoryRepo());
    gh.factory<_i22.SignInDataProvider>(() => _i22.SignInDataProvider(
          gh<_i7.Dio>(),
          gh<_i6.CookieManager>(),
        ));
    gh.factory<_i23.AttendenceApiProvider>(() => _i23.AttendenceApiProvider(
          gh<_i7.Dio>(),
          gh<_i6.CookieManager>(),
        ));
    gh.factory<_i24.AttendenceBloc>(
        () => _i24.AttendenceBloc(gh<_i3.AttendenceRepository>()));
    gh.factory<_i25.DashboardBloc>(() => _i25.DashboardBloc(
          gh<_i3.GetDutyRepository>(),
          gh<_i3.GetSalaryDetailsRepository>(),
        ));
    gh.factory<_i26.DashboardDataProvider>(() => _i26.DashboardDataProvider(
          gh<_i7.Dio>(),
          gh<_i6.CookieManager>(),
        ));
    gh.factory<_i27.SalaryTransactionHistoryBloc>(() =>
        _i27.SalaryTransactionHistoryBloc(
            gh<_i3.SalaryTransactionHistoryRepository>()));
    return this;
  }
}

class _$DioModule extends _i28.DioModule {}
