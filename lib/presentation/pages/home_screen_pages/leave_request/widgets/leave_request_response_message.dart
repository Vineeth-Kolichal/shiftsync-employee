import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/blocs/leave_request/leave_request_bloc.dart';
import 'package:shiftsync/util/constants/constants.dart';

class LeaveRequestResponseMessage extends StatelessWidget {
  const LeaveRequestResponseMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocBuilder<LeaveRequestBloc, LeaveRequestState>(
          builder: (context, state) {
            Timer(const Duration(milliseconds: 5000), () {
              Navigator.of(context).pushReplacementNamed('/home_screen');
            });
            if (state is LeaveRequestResponseState &&
                (state.leaveRequestRespModel.status == 200 ||
                    state.leaveRequestRespModel.status == 201)) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/lottie_jsons/form_submit_success.json',
                    width: size.width * 0.4,
                  ),
                  kheightTwenty,
                  Text(state.leaveRequestRespModel.message ??
                      'Form Submitted successfully'),
                ],
              );
            } else if (state is LeaveRequestResponseState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/lottie_jsons/form_submit_fail.json',
                    width: size.width * 0.4,
                  ),
                  kheightTwenty,
                  Text(state.leaveRequestRespModel.message ??
                      'Failed to submit form'),
                  (state.leaveRequestRespModel.errors != null &&
                          state.leaveRequestRespModel.errors!.isNotEmpty)
                      ? Text(state.leaveRequestRespModel.errors![0])
                      : const SizedBox()
                ],
              );
            } else {
              return Center(
                  child: SizedBox(
                child: LottieBuilder.asset(
                  'assets/lottie_jsons/no-internet.json',
                  width: size.width * 0.4,
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}
