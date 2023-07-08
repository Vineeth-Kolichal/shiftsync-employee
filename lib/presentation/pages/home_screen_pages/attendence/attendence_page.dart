import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/attendence/attendence_bloc.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/util/constants/constants.dart';

import 'widgets/attendance_litst_tile.dart';

class AttendencePage extends StatelessWidget {
  const AttendencePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AttendenceBloc>().add(const GetAttendence());
    });
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: BoldTitleText(title: 'Attendence'),
          ),
          kHeightTen,
          Expanded(
            child: BlocBuilder<AttendenceBloc, AttendenceState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.hasError) {
                  return const Center(
                    child: Text('Oops.. Something error'),
                  );
                } else {
                  if (state.attendenceList.isEmpty) {
                    return const Center(
                      child: Text('No attendence History found'),
                    );
                  }
                  return ListView.separated(
                    itemBuilder: (ctx, index) {
                      return AttendenceTileWidget(
                        attendance: state.attendenceList[index],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return kHeightTen;
                    },
                    itemCount: state.attendenceList.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
