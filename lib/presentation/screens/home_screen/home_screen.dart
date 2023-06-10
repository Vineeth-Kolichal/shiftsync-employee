import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/application/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/presentation/common_widgets/custom_bottom_navigationbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Widget> pages = [
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
    return BlocBuilder<CustomBottmNavigationCubit, CustomBottmNavigationState>(
      builder: (context, state) {
        return Scaffold(
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
