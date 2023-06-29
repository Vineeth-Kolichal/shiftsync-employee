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
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart'
    as _i3;
import 'package:shiftsync/data/data_providers/duty_apr_provider/duty_api_provider.dart'
    as _i6;
import 'package:shiftsync/util/dio_object/dio_module.dart' as _i7;

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
    return this;
  }
}

class _$DioModule extends _i7.DioModule {}
