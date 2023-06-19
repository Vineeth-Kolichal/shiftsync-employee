import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/bussiness_logic/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/attendence/attendence_page.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/dashboard/dashboard_page.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/leave_request/leave_request_page.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/salary_details/salary_details_page.dart';
import 'package:shiftsync/presentation/widgets/custom_drawer/cusrom_drawer.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/custom_bottom_navigationbar/custom_bottom_navigationbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Widget> pages = [
    DashboardPage(),
    LeaveRequestpage(),
    AttendencePage(),
    SalaryDetailsPage()
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CustomBottmNavigationCubit, CustomBottmNavigationState>(
      builder: (ctx, state) {
        return BlocListener<InternetConnectionCheckCubit,
            InternetConnectionCheckState>(
          listener: (context, state) {
            // if (state is InternetDisconnected) {
            //   Flushbar(
            //     isDismissible: false,
            //     messageColor: Colors.white,
            //     titleColor: Colors.white,
            //     backgroundColor: Colors.red,
            //     flushbarPosition: FlushbarPosition.TOP,
            //     title: 'Connectivity error',
            //     message: 'Please turn on wifi or mobile data',
            //     // duration: const Duration(seconds: 3),
            //   ).show(ctx);
            // } else {
            //   Navigator.of(ctx).pop();
            // }
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
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Iconsax.user_octagon,
                      ),
                    ),
                  ),
                  title: Image.asset(
                    'assets/images/title.png',
                    width: size.width * 0.4,
                  ),
                  trailing:
                      (state.selectedIndex == 1 || state.selectedIndex == 3)
                          ? SizedBox(
                              width: 30,
                              child: PopupMenuButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                icon: const Icon(Iconsax.more_square),
                                itemBuilder: (ctx) {
                                  return [
                                    PopupMenuItem(
                                      height: 25,
                                      onTap: () {},
                                      child: Text(state.selectedIndex == 1
                                          ? 'Status/History'
                                          : 'View salary History'),
                                    ),
                                  ];
                                },
                              ),
                            )
                          : null,
                ),
              ),
            ),
            drawer: const CustomDrawer(),
            body: pages[state.selectedIndex],
            bottomNavigationBar: const CustomBottomNavigationbar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
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
    );
  }
}
