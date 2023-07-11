import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/dashboard/dashboard_bloc.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/dashboard/widgets/dashboard_loading.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/dashboard/widgets/quote_slider_section.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/colors/common_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'widgets/duty_section.dart';
import 'widgets/profile_correction_section.dart';
import 'widgets/total_salary_section.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DashboardBloc>().add(DashboardEvent());
    });
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardResponseState) {
          log(state.duty.message.toString());
          return Scaffold(
            body: Column(
              children: [
                const QuoteSliderSection(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width * 0.25,
                      child: const Divider(),
                    ),
                    const Text(
                      'Welcome To SiftSync',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: size.width * 0.25,
                      child: const Divider(),
                    ),
                  ],
                ),
                kheightTwenty,
                (state.dashboardModel.message ==
                        "You need to fill the application form")
                    ? const ProfileRegOrCorrectionSection(
                        content:
                            'Please complete profile registration\nbefore getting started',
                      )
                    : (state.dashboardModel.message ==
                            "Admin requested for correction")
                        ? ProfileRegOrCorrectionSection(
                            content:
                                'Admin requested for correction\nplease fill details again',
                            message: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TitileText(title: "Mistakes: "),
                                Text(state.dashboardModel.data![0]),
                              ],
                            ),
                          )
                        : (state.dashboardModel.message ==
                                "Welcome to dashboard")
                            ? Column(
                                children: [
                                  kheightTwenty,
                                  (state.duty.status == 404)
                                      ? Container(
                                          width: size.width * 0.9,
                                          height: size.width * 0.3,
                                          decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Center(
                                            child: Text(
                                              'Duty not Assigned yet\n Please contact to admin',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : DutySection(
                                          dutyType:
                                              '${state.duty.data![0].type}'),
                                  kheightTwenty,
                                  (state.salaryDetailsModel.status != 200)
                                      ? const TotalSalarySection(
                                          fontSize: 16,
                                          totalSalary:
                                              'Salary details not generated')
                                      : TotalSalarySection(
                                          totalSalary:
                                              '₹${state.salaryDetailsModel.salaryDetails?.netsalary}',
                                        )
                                ],
                              )
                            : const SizedBox()
              ],
            ),
          );
        } else {
          return const DashboardLoadingWidget();
        }
      },
    );
  }
}
