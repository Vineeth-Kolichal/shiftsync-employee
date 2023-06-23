import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart';
import 'package:shiftsync/util/constants/constants.dart';

class FormSubmitMessage extends StatelessWidget {
  const FormSubmitMessage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child:
            BlocBuilder<CompleteProfileScreenBloc, CompleteProfileScreenState>(
          builder: (context, state) {
            if (state is ProfileFormSubmitRespState) {
              log(state.profileFormResponseModel.status.toString());
            }
            Timer(const Duration(milliseconds: 5000), () {
              Navigator.of(context).pushReplacementNamed('/home_screen');
            });
            if (state is ProfileFormSubmitRespState &&
                (state.profileFormResponseModel.status == 200 ||
                    state.profileFormResponseModel.status == 201)) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/lottie_jsons/form_submit_success.json',
                    width: size.width * 0.4,
                  ),
                  kheightTwenty,
                  Text(state.profileFormResponseModel.message ??
                      'Form Submitted successfully'),
                ],
              );
            } else if (state is ProfileFormSubmitRespState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/lottie_jsons/form_submit_fail.json',
                    width: size.width * 0.4,
                  ),
                  kheightTwenty,
                  Text(state.profileFormResponseModel.message ??
                      'Failed to submit form'),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
