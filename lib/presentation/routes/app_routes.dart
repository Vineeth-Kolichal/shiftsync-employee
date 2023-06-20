import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/complete_profile_details_screen.dart';
import 'package:shiftsync/presentation/screens/home_screen/home_screen.dart';
import 'package:shiftsync/presentation/screens/intro_screen/intro_screen.dart';
import 'package:shiftsync/presentation/screens/set_pin_screen/set_pin_screen.dart';
import 'package:shiftsync/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:shiftsync/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:shiftsync/presentation/screens/splash_screen/splash_screen.dart';
import 'package:shiftsync/presentation/screens/view_leave_status_history_screen/view_leave_status_history_screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case '/intro':
        return MaterialPageRoute(builder: (ctx) => const IntroScreen());
      case '/sign_in':
        return MaterialPageRoute(builder: (ctx) => SignInScreen());
      case '/sign_up':
        return MaterialPageRoute(builder: (ctx) => SignUpScreen());
      case '/home_screen':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      case '/set_pin':
        return MaterialPageRoute(builder: (ctx) => SetPinScreen());
      case '/complete_profile':
        return MaterialPageRoute(
            builder: (ctx) => const CompleteProfileDetailsScreen());
      case '/view_status_history':
        return MaterialPageRoute(
            builder: (ctx) => const ViewLeaveStatusHistoryScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return const Scaffold(
        body: Center(
          child: Text('Something Error'),
        ),
      );
    });
  }
}
