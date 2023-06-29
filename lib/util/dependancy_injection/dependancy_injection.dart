import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  getIt.init(environment: Environment.prod);
}
