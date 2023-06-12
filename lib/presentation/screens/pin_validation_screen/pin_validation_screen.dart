import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:shiftsync/application/cubits/pin_verification_loading/pin_verification_loading_cubit.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/presentation/widgets/background_stack.dart';
import 'package:shiftsync/presentation/widgets/pin_input_field.dart';
import 'widget/number_key_row_widget.dart';
import 'widget/pin_key_widget.dart';

class PinValidationScreen extends StatelessWidget {
  const PinValidationScreen({super.key, required this.routeName});
  final String routeName;
  @override
  Widget build(BuildContext context) {
    context.read<PinVerificationLoadingCubit>().changeWrongPinState(false);
    TextEditingController pinController = TextEditingController(text: '');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: size.width * 0.25,
              ),
              LottieBuilder.asset(
                'assets/lottie_jsons/unlock.json',
                height: size.width * 0.3,
              ),
              kheightTwenty,
              const Text(
                'Enter PIN',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              PinInputField(
                keyboardType: TextInputType.none,
                controller: pinController,
                pinLength: 4,
                onCompleted: (pinValue) async {
                  context.read<PinVerificationLoadingCubit>().verifyPin(
                        pinValue: pinValue,
                        context: context,
                        routeName: routeName,
                      );
                },
              ),
              kHeightTen,
              SizedBox(
                height: 30,
                child: BlocBuilder<PinVerificationLoadingCubit,
                    PinVerificationLoadingState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: customPrimaryColor,
                          size: 25,
                        ),
                      );
                    } else if (state.isWrongPin) {
                      return const Center(
                        child: Text(
                          'You enterd worong PIN !',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              kHeightTen,
              Column(
                children: [
                  NumberKeyRowWidget(
                      size: size,
                      pinController: pinController,
                      keysValue: const ['1', '2', '3']),
                  const Divider(),
                  NumberKeyRowWidget(
                      size: size,
                      pinController: pinController,
                      keysValue: const ['4', '5', '6']),
                  const Divider(),
                  NumberKeyRowWidget(
                      size: size,
                      pinController: pinController,
                      keysValue: const ['7', '8', '9']),
                  const Divider(),
                  SizedBox(
                    height: size.width * 0.15,
                    //color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PinKeyboardButton(
                          keylabel: const SizedBox(),
                          size: size,
                          onTap: () {
                            // if (pinController.text.length < 4) {
                            //   pinController.text = '${pinController.text}${keysValue[0]}';
                            // }
                          },
                        ),
                        const VerticalDivider(),
                        PinKeyboardButton(
                          keylabel: const Text(
                            '0',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          size: size,
                          onTap: () {
                            if (pinController.text.length < 4) {
                              pinController.text = '${pinController.text}0';
                            }
                          },
                        ),
                        const VerticalDivider(),
                        PinKeyboardButton(
                          keylabel: const Icon(Icons.backspace),
                          size: size,
                          onTap: () {
                            if (pinController.text.length > 1) {
                              pinController.text = pinController.text
                                  .substring(0, pinController.length - 1);
                            } else if (pinController.text.length == 1) {
                              pinController.text = '';
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
