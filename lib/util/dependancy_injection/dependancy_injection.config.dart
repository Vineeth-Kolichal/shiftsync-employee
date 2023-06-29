// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:dio_cookie_manager/dio_cookie_manager.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shiftsync/bussiness_logic/blocs/bloc/punch_in_screen_bloc.dart'
    as _i12;
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart'
    as _i3;
import 'package:shiftsync/data/data_providers/dashboard/dashboard_data_provider.dart'
    as _i14;
import 'package:shiftsync/data/data_providers/duty_apr_provider/duty_api_provider.dart'
    as _i6;
import 'package:shiftsync/data/data_providers/leave_request/leave_request_api.dart'
    as _i9;
import 'package:shiftsync/data/data_providers/logout/logout.dart' as _i10;
import 'package:shiftsync/data/data_providers/profile_form/profile_form_api_provider.dart'
    as _i11;
import 'package:shiftsync/data/data_providers/sign_in/sign_in_data_provider.dart'
    as _i13;
import 'package:shiftsync/data/repositories/get_duty_repository/get_duty_repo_implementation.dart'
    as _i8;
import 'package:shiftsync/data/repositories/repositories.dart' as _i7;
import 'package:shiftsync/util/dio_object/dio_module.dart' as _i15;

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
    gh.factory<_i3.CompleteProfileScreenBloc>(
        () => _i3.CompleteProfileScreenBloc());
    gh.lazySingleton<_i4.CookieManager>(() => dioModule.cookieManager);
    gh.lazySingleton<_i5.Dio>(() => dioModule.dioInstance);
    gh.factory<_i6.DutyApiProvider>(() => _i6.DutyApiProvider(
          gh<_i5.Dio>(),
          gh<_i4.CookieManager>(),
        ));
    gh.lazySingleton<_i7.GetDutyRepository>(
        () => _i8.GetDutyRepoImplementation());
    gh.factory<_i9.LeaveRequestApi>(() => _i9.LeaveRequestApi(
          gh<_i5.Dio>(),
          gh<_i4.CookieManager>(),
        ));
    gh.factory<_i10.Logout>(() => _i10.Logout(
          gh<_i5.Dio>(),
          gh<_i4.CookieManager>(),
        ));
    gh.factory<_i11.ProfileFormApiProvider>(() => _i11.ProfileFormApiProvider(
          gh<_i5.Dio>(),
          gh<_i4.CookieManager>(),
        ));
    gh.factory<_i12.PunchInScreenBloc>(
        () => _i12.PunchInScreenBloc(gh<_i7.GetDutyRepository>()));
    gh.factory<_i13.SignInDataProvider>(() => _i13.SignInDataProvider(
          gh<_i5.Dio>(),
          gh<_i4.CookieManager>(),
        ));
    gh.factory<_i14.DashboardDataProvider>(() => _i14.DashboardDataProvider(
          gh<_i5.Dio>(),
          gh<_i4.CookieManager>(),
        ));
    return this;
  }
}

class _$DioModule extends _i15.DioModule {}
