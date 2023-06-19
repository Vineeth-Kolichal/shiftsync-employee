import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/util/constants/shared_preference_key_names.dart';
import 'package:shiftsync/presentation/widgets/background_stack.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/pin_input_field.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';

// ignore: must_be_immutable
class SetPinScreen extends StatelessWidget {
  SetPinScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController newPinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  appBarColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/home_screen');
                    },
                    child: const SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(Iconsax.arrow_left_2)),
                  ),
                  title: const Text(
                    'Set/Reset PIN',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.2,
                ),
                LottieBuilder.asset(
                  'assets/lottie_jsons/pin_set.json',
                  height: size.width * 0.3,
                ),
                kheightTwenty,
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.17),
                  child: const Row(
                    children: [
                      Text(
                        'Enter New PIN',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                PinInputField(
                  keyboardType: TextInputType.number,
                  pinLength: 4,
                  controller: newPinController,
                ),
                kheightTwenty,
                kheightTwenty,
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.17),
                  child: const Row(
                    children: [
                      Text(
                        'Confirm PIN',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                PinInputField(
                  keyboardType: TextInputType.number,
                  pinLength: 4,
                  controller: confirmPinController,
                ),
                kheightTwenty,
                kheightTwenty,
                SubmitButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (newPinController.text == confirmPinController.text) {
                        Navigator.of(context)
                            .pushReplacementNamed('/home_screen');
                        final shared = await SharedPreferences.getInstance();
                        shared.setString(pin, newPinController.text);
                      }
                    }
                  },
                  label: 'Confirm',
                  buttonWidth: 0.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
