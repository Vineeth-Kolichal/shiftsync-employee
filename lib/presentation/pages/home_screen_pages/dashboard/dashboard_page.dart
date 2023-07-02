import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/dashboard/dashboard_bloc.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/dashboard/widgets/dashboard_loading.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/dashboard/widgets/quote_slider_section.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'widgets/duty_section.dart';
import 'widgets/profile_correction_section.dart';
import 'widgets/total_salary_section.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardResponseState) {
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
                                      ? Container()
                                      : DutySection(
                                          dutyType:
                                              '${state.duty.data![0].type}'),
                                  kheightTwenty,
                                  TotalSalarySection(
                                    totalSalary: 200000,
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
