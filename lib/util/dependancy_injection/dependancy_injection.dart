import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.config.dart';
import 'package:shiftsync/util/dio_object/dio_object.dart';

GetIt locator = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  locator.init(environment: Environment.prod);
}
