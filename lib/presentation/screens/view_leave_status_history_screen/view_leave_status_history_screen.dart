import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/bussiness_logic/blocs/leave_status_history/leave_status_history_bloc.dart';
import 'package:shiftsync/presentation/screens/view_leave_status_history_screen/widgets/leave_history_loading.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

import 'widgets/leave_history_tile.dart';

class ViewLeaveStatusHistoryScreen extends StatelessWidget {
  const ViewLeaveStatusHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LeaveStatusHistoryBloc>().add(const Started());
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
                title: const BoldTitleText(title: 'Leave Status/History'),
                appBarColor: appBarColor),
          ),
        ),
        body: BlocBuilder<LeaveStatusHistoryBloc, LeaveStatusHistoryState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LeaveHistoryLoading();
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      return LeaveHistoryTile(
                        leaveStatusHistory:
                            state.lshModel!.leaveStatusHistory![index],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return kHeightTen;
                    },
                    itemCount: state.lshModel!.leaveStatusHistory!.length),
              );
            }
          },
        ));
  }
}
