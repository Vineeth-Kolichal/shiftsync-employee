import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shiftsync/bussiness_logic/blocs/bloc/punch_in_screen_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/dashboard/dashboard_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/leave_request/leave_request_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/otp_verification/otp_verification_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/sign_in/sign_in_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/sign_up/sign_up_bloc.dart';
import 'package:shiftsync/bussiness_logic/cubits/confirm_password/confirm_password_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/logout/logout_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/pin_verification_loading/pin_verification_loading_cubit.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/presentation/routes/app_routes.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';

late Directory appDirectory;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appDirectory = await getTemporaryDirectory();
  await configureInjection();
  // appDirectory = await getApplicationDocumentsDirectory();
  runApp(ShiftSyncApp(
    appRoutes: AppRoutes(),
    connectivity: Connectivity(),
  ));
}

class ShiftSyncApp extends StatelessWidget {
  const ShiftSyncApp(
      {super.key, required this.appRoutes, required this.connectivity});
  final AppRoutes appRoutes;
  final Connectivity connectivity;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectionCheckCubit>(
          create: (ctx) =>
              InternetConnectionCheckCubit(connectivity: connectivity),
        ),
        BlocProvider<CustomBottmNavigationCubit>(
          create: (ctx) => CustomBottmNavigationCubit(),
        ),
        BlocProvider<PinVerificationLoadingCubit>(
          create: (ctx) => PinVerificationLoadingCubit(),
        ),
        BlocProvider<ConfirmPasswordCubit>(
          create: (ctx) => ConfirmPasswordCubit(),
        ),
        BlocProvider<SignInBloc>(
          create: (ctx) => SignInBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (ctx) => SignUpBloc(),
        ),
        BlocProvider<OtpVerificationBloc>(
          create: (ctx) => OtpVerificationBloc(),
        ),
        BlocProvider<LogoutCubit>(
          create: (ctx) => LogoutCubit(),
        ),
        BlocProvider<CompleteProfileScreenBloc>(
          create: (ctx) => CompleteProfileScreenBloc(),
        ),
        BlocProvider<DashboardBloc>(
          create: (ctx) => DashboardBloc(),
        ),
        BlocProvider<LeaveRequestBloc>(
          create: (ctx) => LeaveRequestBloc(),
        ),
        BlocProvider(
          create: (ctx) => getIt<PunchInScreenBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: customPrimaryColor,
          scaffoldBackgroundColor: scafoldBackgroundColor,
        ),
        onGenerateRoute: appRoutes.onGenerateRoute,
        //home: FormSubmitMessage(),
      ),
    );
  }
}
