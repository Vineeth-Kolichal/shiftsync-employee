import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync/application/cubits/confirm_password/confirm_password_cubit.dart';
import 'package:shiftsync/application/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/application/cubits/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:shiftsync/application/cubits/pin_verification_loading/pin_verification_loading_cubit.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/presentation/routes/app_routes.dart';

Future<void> main() async {
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
    AppRoutes appRoutes = AppRoutes();
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: customPrimaryColor,
          scaffoldBackgroundColor: scafoldBackgroundColor,
        ),
        onGenerateRoute: appRoutes.onGenerateRoute,
        //home: SetPinScreen(),
      ),
    );
  }
}
