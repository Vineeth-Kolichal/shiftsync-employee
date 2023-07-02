

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/blocs/punch_in_screen_bloc/punch_in_screen_bloc.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';
import 'package:shiftsync/presentation/screens/otp_verification_screen/screen_otp_verification.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/alert_popup_functions/response_message_snackbar.dart';
import 'package:shiftsync/util/constants/constants.dart';

import 'widgets/loading_duty.dart';
import 'widgets/punch_in_status_alert.dart';

class PunchingScreen extends StatelessWidget {
  const PunchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PunchInScreenBloc>().add(const GetDuty());
    });
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocListener<PunchInScreenBloc, PunchInScreenState>(
        listener: (context, state) {
          if (state.isOtpVerified != null) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) {
                  return PunchInAlert(
                    isOtpVerified: state.isOtpVerified!,
                  );
                });
          }
          if (state.isSend != null) {
            if (state.isSend!) {
              ScaffoldMessenger.of(context).showSnackBar(
                  responseMessageSnackbar(
                      message: 'OTP send', color: Colors.green));
              Future.delayed(const Duration(milliseconds: 1100), () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((ctx) => OtpVerificationScreen(
                          nextRoute: '/home_screen',
                          otpMessage:
                              'An OTP send to your Registered\n Mobile number',
                          onCompleted: (otp) {
                            context
                                .read<PunchInScreenBloc>()
                                .add(VerifyOtp(otp: OtpModel(otp: otp)));
                          },
                          resendOtp: () {
                            context
                                .read<PunchInScreenBloc>()
                                .add(const SendOtp());
                          },
                        )),
                  ),
                );
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                responseMessageSnackbar(
                    message: 'Something Error', color: Colors.red),
              );
            }
          }
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              appBarColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(Iconsax.arrow_left_2),
                ),
              ),
              title: Image.asset(
                'assets/images/title.png',
                width: size.width * 0.4,
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.width * 0.5,
                width: size.width,
                child: LottieBuilder.asset(
                  'assets/lottie_jsons/attendence.json',
                  height: size.width * 0.5,
                  width: size.width * 0.7,
                ),
              ),
              BlocBuilder<PunchInScreenBloc, PunchInScreenState>(
                builder: (context, state) {
                  if (state.dutymodel != null) {
                
                    return Container(
                      height: size.width * 0.5,
                      width: size.width * 0.75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (state.dutymodel?.status != 404)
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TitileText(title: 'Time:'),
                                    kWidthFive,
                                    Text('${state.dutymodel?.data?[0].time}'),
                                  ],
                                )
                              : const Icon(Iconsax.danger),
                          kHeightTen,
                          (state.dutymodel?.status != 404)
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TitileText(title: 'Duty:'),
                                    kWidthFive,
                                    Text('${state.dutymodel?.data?[0].type}')
                                  ],
                                )
                              : Text(
                                  (state.punchInStatus)
                                      ? 'Punch out only after duty time!!'
                                      : 'Duty not scheduled yet.\nPlease contact admin!!',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                ),
                          kHeightTen,
                          Visibility(
                            visible: (state.dutymodel?.status != 404 ||
                                state.punchInStatus),
                            child: SubmitButton(
                              onPressed: () {
                                if (state.punchInStatus) {
                                  context
                                      .read<PunchInScreenBloc>()
                                      .add(const PunchOut());
                                } else {
                                  context
                                      .read<PunchInScreenBloc>()
                                      .add(const SendOtp());
                                }
                              },
                              label: state.punchInStatus
                                  ? 'Punch Out'
                                  : 'Punch in',
                              buttonWidth: 0.5,
                              backgroundColor: state.punchInStatus
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return LoadingWidget(size: size);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

