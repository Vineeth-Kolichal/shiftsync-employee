import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/bussiness_logic/blocs/salary_transaction_history/salary_transaction_history_bloc.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/empty_item_widget.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

import 'widgets/salary_history_tile.dart';

class SalaryHistoryScreen extends StatelessWidget {
  const SalaryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SalaryTransactionHistoryBloc>().add(const GetHistory());
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          child: CustomAppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Icon(
                      Iconsax.arrow_left_2,
                    ),
                  ),
                ),
              ),
              title: const BoldTitleText(title: 'Salary Credit History'),
              appBarColor: appBarColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<SalaryTransactionHistoryBloc,
            SalaryTransactionHistoryState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.salaryHistoryModel != null &&
                state.salaryHistoryModel!.salaryHistory.isEmpty) {
              return const EmptyItemWidget(
                message: 'Salary History is empty',
              );
            }
            return ListView.separated(
                itemBuilder: (ctx, index) {
                  return SalaryHistoryTile(
                    salaryHistory:
                        state.salaryHistoryModel!.salaryHistory[index],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return kHeightTen;
                },
                itemCount: state.salaryHistoryModel!.salaryHistory.length);
          },
        ),
      ),
    );
  }
}

