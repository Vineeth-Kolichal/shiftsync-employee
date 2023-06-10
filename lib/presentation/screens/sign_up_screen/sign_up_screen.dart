import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/core/colors/common_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/presentation/common_widgets/background_stack.dart';
import 'package:shiftsync/presentation/common_widgets/sign_in_text_form_field.dart';
import 'package:shiftsync/presentation/common_widgets/submit_button.dart';
import 'package:shiftsync/presentation/screens/sign_in_screen/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordFirstController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheightTwenty,
              LottieBuilder.asset(
                'assets/lottie_jsons/signup.json',
                height: size.width * 0.45,
                width: size.width * 0.45,
              ),
              kHeightTen,
              const Text('Sign Up to'),
              kHeightFive,
              Image.asset(
                'assets/images/title.png',
                width: size.width * 0.4,
              ),
              kheightTwenty,
             const  Row(
                children: [
                  Padding(
                    padding:
                         EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                        icon: Iconsax.user_octagon,
                        hintText: 'Full Name',
                        suffix: null,
                        obscureText: false,
                        controller: fullnameController,
                        keyboardType: TextInputType.text,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: CupertinoIcons.mail,
                        hintText: 'e-mail',
                        suffix: null,
                        obscureText: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: Iconsax.call,
                        hintText: 'Phone Number',
                        suffix: null,
                        obscureText: false,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: Iconsax.user,
                        hintText: 'User Name',
                        suffix: null,
                        obscureText: false,
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: Iconsax.lock_1,
                        hintText: 'password',
                        suffix: InkWell(
                          onTap: () {},
                          child: Icon(
                            Iconsax.eye,
                            color: iconBlackColor,
                          ),
                        ),
                        obscureText: true,
                        controller: passwordFirstController,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: Iconsax.lock_1,
                        hintText: 'Confirm Password',
                        suffix: InkWell(
                          onTap: () {},
                          child: Icon(
                            Iconsax.eye,
                            color: iconBlackColor,
                          ),
                        ),
                        obscureText: true,
                        controller: passwordConfirmController,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      kheightTwenty,
                      SubmitButton(onPressed: () {}, label: 'Sign Up'),
                      kheightTwenty,
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('sign_in');
                        },
                        child: const Text(
                          'Sing In',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      kHeightTen
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
