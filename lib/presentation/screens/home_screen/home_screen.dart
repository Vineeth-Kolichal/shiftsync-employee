import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/bussiness_logic/blocs/dashboard/dashboard_bloc.dart';
import 'package:shiftsync/bussiness_logic/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:shiftsync/presentation/screens/view_leave_status_history_screen/view_leave_status_history_screen.dart';
import 'package:shiftsync/util/alert_popup_functions/home_screen_alert.dart';
import 'package:shiftsync/util/alert_popup_functions/no_internet_banner.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/attendence/attendence_page.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/dashboard/dashboard_page.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/leave_request/leave_request_page.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/salary_details/salary_details_page.dart';
import 'package:shiftsync/presentation/widgets/custom_drawer/cusrom_drawer.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/custom_bottom_navigationbar/custom_bottom_navigationbar.dart';
import 'package:shiftsync/util/constants/shared_preference_key_names.dart';
import 'package:shiftsync/util/cookie_handler/persist_cookiejar.dart';
import 'package:shiftsync/util/debouncer/debouncer.dart';

import '../pin_validation_screen/pin_validation_screen.dart';

Debouncer debouncer = Debouncer(milliseconds: 1000);

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Widget> pages = [
    const DashboardPage(),
    const LeaveRequestpage(),
    const AttendencePage(),
    const SalaryDetailsPage()
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardResponseState &&
            state.dashboardModel.msg != null) {
          persistCookieJar.deleteAll();
          showAlert(
            context: context,
            title: const Text('Oops'),
            content: 'Your session is expired, please sign in again!',
            nextRouteName: '/sign_in',
            buttonLabel: 'Sign In',
          );
        }
      },
      child:
          BlocBuilder<CustomBottmNavigationCubit, CustomBottmNavigationState>(
        builder: (ctx, state) {
          return BlocListener<InternetConnectionCheckCubit,
              InternetConnectionCheckState>(
            listener: (context, state) {
              if (state is InternetDisconnected) {
                ScaffoldMessenger.of(context)
                    .showMaterialBanner(noInternetBanner());
              } else {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              }
            },
            child: Scaffold(
              key: scaffoldKey,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: SafeArea(
                  child: CustomAppBar(
                      appBarColor: appBarColor,
                      leading: InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircleAvatar(
                            backgroundColor: customPrimaryColor[50],
                            child: Image.asset(
                              'assets/images/icon .png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Icon(
                          //   Iconsax.more_2,
                          // ),
                        ),
                      ),
                      title: Image.asset(
                        'assets/images/title.png',
                        width: size.width * 0.4,
                      ),
                      trailing:
                          (state.selectedIndex == 1 || state.selectedIndex == 3)
                              ? SizedBox(
                                  width: 49,
                                  height: 30,
                                  child: SubmenuButton(menuChildren: [
                                    InkWell(
                                      onTap: () {
                                        if (state.selectedIndex == 1) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: ((BuildContext ctx) =>
                                                  const ViewLeaveStatusHistoryScreen()),
                                            ),
                                          );
                                        } else {
                                          Navigator.of(context)
                                              .pushNamed('/salary-history');
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text((state.selectedIndex == 1)
                                            ? 'Status/History'
                                            : 'Salary History'),
                                      ),
                                    )
                                  ], child: const Icon(Iconsax.more_square)))
                              : null),
                ),
              ),
              drawer: const CustomDrawer(),
              body: pages[state.selectedIndex],
              bottomNavigationBar: const CustomBottomNavigationbar(),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  SharedPreferences shared =
                      await SharedPreferences.getInstance();
                  final pinValue = shared.getString(pin);
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (pinValue == null) {
                      Navigator.of(context).pushNamed('/punch');
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((ctx) =>
                              const PinValidationScreen(routeName: '/punch')),
                        ),
                      );
                    }
                  });
                },
                child: const Icon(
                  Iconsax.finger_scan,
                  size: 30,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          );
        },
      ),
    );
  }
}
