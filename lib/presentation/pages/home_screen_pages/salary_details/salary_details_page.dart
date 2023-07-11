// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shiftsync/bussiness_logic/blocs/salary_details_page/salary_details_page_bloc.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/salary_details/widgets/pay_details_row_widget.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class SalaryDetailsPage extends StatelessWidget {
  const SalaryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SalaryDetailsPageBloc>().add(GetDetails());
    });
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<SalaryDetailsPageBloc, SalaryDetailsPageState>(
        builder: (context, state) {
          if (state.isLoading) {
            return SizedBox(
              height: size.height,
              width: size.width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.salaryDetailsModel?.status == 200) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldTitleText(title: 'Pay detials'),
                  kDividerTwo,
                  PayDetilsRowWidget(
                    leadingText: 'Grade:',
                    text: state.salaryDetailsModel?.salaryDetails?.grade ??
                        'Grade',
                    fontColor: customPrimaryColor,
                    prefix: '',
                  ),
                  PayDetilsRowWidget(
                    leadingText: 'Pay type:',
                    text: 'Salary',
                    prefix: '',
                  ),
                  PayDetilsRowWidget(
                    leadingText: 'Pay frequency:',
                    text: 'Monthly',
                    prefix: '',
                  ),
                  PayDetilsRowWidget(
                    leadingText: 'Base salary',
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.basesalary}',
                  ),
                  kDividerTwo,
                  PayDetilsRowWidget(
                    leadingText: 'Dearness Allowance',
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.dallowance}',
                  ),
                  PayDetilsRowWidget(
                    leadingText: 'Special Allowance',
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.dallowance}',
                  ),
                  PayDetilsRowWidget(
                    leadingText: 'Medical Allowance',
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.mallowance}',
                  ),
                  PayDetilsRowWidget(
                    leadingText: 'Over time',
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.overtime}',
                  ),
                  PayDetilsRowWidget(
                    leadingText: 'Gross Salary',
                    leadingColor: Colors.black,
                    fontSize: 18,
                    fontColor: Colors.green,
                    leadingFontSize: 19,
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.grosssalary}',
                  ),
                  kDividerTwo,
                  PayDetilsRowWidget(
                      fontColor: Colors.red,
                      leadingText: 'Professional Tax',
                      text: '${state.salaryDetailsModel?.salaryDetails?.tax}'),
                  PayDetilsRowWidget(
                    leadingText: 'ProvidentFund',
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.provident}',
                    fontColor: Colors.red,
                  ),
                  // PayDetilsRowWidget(
                  //   leadingText: 'Total Deductions',
                  //   leadingColor: Colors.black,
                  //   fontSize: 18,
                  //   fontColor: Colors.red,
                  //   leadingFontSize: 19,
                  //   text: '${state.salaryDetailsModel?.salaryDetails!.tax!+state.salaryDetailsModel?.salaryDetails!.provident}',
                  // ),
                  kDividerTwo,
                  PayDetilsRowWidget(
                    leadingText: 'Net Salary',
                    leadingColor: Colors.black,
                    fontSize: 21,
                    fontColor: Colors.green,
                    leadingFontSize: 22,
                    text:
                        '${state.salaryDetailsModel?.salaryDetails?.netsalary}',
                  ),
                  // TextButton.icon(
                  //     onPressed: () async {},
                  //     icon: Icon(Iconsax.document_download),
                  //     label: Text('Download salary slip'))
                ],
              ),
            );
          } else {
            return SizedBox(
              height: size.height,
              width: size.width,
              child: Center(
                child: Text(state.salaryDetailsModel!.message ??
                    'Something Went wrong'),
              ),
            );
          }
        },
      ),
    );
  }
}
