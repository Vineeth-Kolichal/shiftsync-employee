import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync/application/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/presentation/routes/app_routes.dart';
Future<void> main() async {
  runApp(ShiftSyncApp(
    appRoutes: AppRoutes(),
  ));
}

class ShiftSyncApp extends StatelessWidget {
  const ShiftSyncApp({super.key, required this.appRoutes});
  final AppRoutes appRoutes;
  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomBottmNavigationCubit>(
          create: (ctx) => CustomBottmNavigationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: customPrimaryColor,
          scaffoldBackgroundColor: scafoldBackgroundColor,
        ),
        onGenerateRoute: appRoutes.onGenerateRoute,
        
      ),
    );
  }
}
