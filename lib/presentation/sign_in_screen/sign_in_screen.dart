import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/core/colors/common_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/presentation/common_widgets/background_stack.dart';
import 'package:shiftsync/presentation/common_widgets/sign_in_text_form_field.dart';
import 'package:shiftsync/presentation/common_widgets/submit_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    ValueNotifier<bool> obscureText = ValueNotifier(true);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kheightTwenty,
              LottieBuilder.asset(
                'assets/lottie_jsons/login.json',
                height: size.width * 0.65,
                width: size.width * 0.85,
              ),
              kHeightTen,
              Text('Sign In to'),
              kHeightFive,
              Image.asset(
                'assets/images/title.png',
                width: size.width * 0.4,
              ),
              kheightTwenty,
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text('Please fill the credentials'),
                  ),
                ],
              ),
              Form(
                child: SizedBox(
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      SignInTextFormField(
                        keyboardType: TextInputType.name,
                        controller: userNameController,
                        obscureText: false,
                        icon: Iconsax.user,
                        hintText: 'User name',
                        suffix: null,
                      ),
                      kHeightTen,
                      ValueListenableBuilder(
                          valueListenable: obscureText,
                          builder: (context, isObsecure, _) {
                            return SignInTextFormField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              icon: Iconsax.lock,
                              hintText: 'Password',
                              suffix: InkWell(
                                onTap: () {
                                  if (obscureText.value) {
                                    obscureText.value = false;
                                  } else {
                                    obscureText.value = true;
                                  }
                                },
                                child: Icon(
                                  isObsecure ? Iconsax.eye : Iconsax.eye_slash,
                                  color: iconBlackColor,
                                ),
                              ),
                              obscureText: isObsecure,
                            );
                          }),
                      kHeightTen,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forget Password?'),
                        ],
                      ),
                      kheightTwenty,
                      SubmitButton(
                        label: 'Sing In',
                        onPressed: () {},
                      ),
                      kHeightTen,
                      const Text("Don't you have an account?"),
                      TextButton(onPressed: () {}, child: const Text('Sign Up'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
