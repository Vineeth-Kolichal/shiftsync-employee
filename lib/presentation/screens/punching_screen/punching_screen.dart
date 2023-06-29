import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/blocs/bloc/punch_in_screen_bloc.dart';
import 'package:shiftsync/presentation/screens/otp_verification_screen/screen_otp_verification.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/alert_popup_functions/response_message_snackbar.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

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
          if (state.isSend != null) {
            if (state.isSend!) {
              ScaffoldMessenger.of(context).showSnackBar(
                  responseMessageSnackbar(
                      message: 'OTP send', color: Colors.green));
              Future.delayed(const Duration(milliseconds: 1100), () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((ctx) => OtpVerificationScreen(
                          nextRoute: '/home_screen',
                          otpMessage:
                              'An OTP send to your Registered\n Mobile number',
                          onCompleted: (otp) {},
                        )),
                  ),
                );
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                responseMessageSnackbar(
                    message: 'Something Erro', color: Colors.red),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TitileText(title: 'Time:'),
                              kWidthFive,
                              Text('${state.dutymodel?.data?[0].time}'),
                            ],
                          ),
                          kHeightTen,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TitileText(title: 'Duty:'),
                              kWidthFive,
                              Text('${state.dutymodel?.data?[0].type}')
                            ],
                          ),
                          kHeightTen,
                          SubmitButton(
                            onPressed: () {
                              context
                                  .read<PunchInScreenBloc>()
                                  .add(const SendOtp());
                            },
                            label: 'Punch in',
                            buttonWidth: 0.5,
                            backgroundColor: Colors.green,
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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: size.width * 0.5,
      width: size.width * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child: Container(
                color: Colors.grey,
                height: 10,
                width: size.width * 0.35,
              ),
            ),
          ),
          kHeightTen,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child: Container(
                color: Colors.grey,
                height: 10,
                width: size.width * 0.3,
              ),
            ),
          ),
          kHeightTen,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                height: 30,
                width: size.width * 0.37,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
