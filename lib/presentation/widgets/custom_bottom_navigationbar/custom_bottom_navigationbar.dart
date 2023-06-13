import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/application/cubits/custom_bottom_navigation/custom_bottm_navigation_cubit.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/colors/common_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(color: bottomNavigationbarColor),
      child:
          BlocBuilder<CustomBottmNavigationCubit, CustomBottmNavigationState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<CustomBottmNavigationCubit>()
                      .selectNavigationItem(0);
                },
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Icon(
                    size: 22,
                    Iconsax.home,
                    color: state.selectedIndex == 0
                        ? kSkyBlueColor
                        : iconBlackColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context
                      .read<CustomBottmNavigationCubit>()
                      .selectNavigationItem(1);
                },
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Icon(
                    size: 22,
                    Iconsax.document_text,
                    color: state.selectedIndex == 1
                        ? kSkyBlueColor
                        : iconBlackColor,
                  ),
                ),
              ),
              kWidthFive,
              kWidthFive,
              InkWell(
                onTap: () {
                  context
                      .read<CustomBottmNavigationCubit>()
                      .selectNavigationItem(2);
                },
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Icon(
                    size: 22,
                    Iconsax.calendar_1,
                    color: state.selectedIndex == 2
                        ? kSkyBlueColor
                        : iconBlackColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context
                      .read<CustomBottmNavigationCubit>()
                      .selectNavigationItem(3);
                },
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Icon(
                    size: 22,
                    Iconsax.money_recive,
                    color: state.selectedIndex == 3
                        ? kSkyBlueColor
                        : iconBlackColor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
