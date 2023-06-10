import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/application/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/presentation/widgets/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/custom_bottom_navigationbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<Widget> pages = const [
    Center(
      child: Text('Dashboard'),
    ),
    Center(
      child: Text('leave Request'),
    ),
    Center(
      child: Text('Attendence'),
    ),
    Center(
      child: Text('Salary details'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CustomBottmNavigationCubit, CustomBottmNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: SafeArea(
                child: CustomAppBar(
                  leading: InkWell(
                    onTap: () {},
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
                          // InkWell(
                          //     onTap: () {
                          //       if (state.selectedIndex == 1) {}
                          //       if (state.selectedIndex == 3) {}
                          //     },
                          //     child: const SizedBox(
                          //         height: 30,
                          //         width: 30,
                          //         child: Icon(Iconsax.more_square)),
                          //   )
                          : null,
                ),
              )),
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
        );
      },
    );
  }
}
