import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/cubits/confirm_password/confirm_password_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:shiftsync/core/colors/common_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/core/debouncer/debouncer.dart';
import 'package:shiftsync/presentation/screens/otp_verification_screen/screen_otp_verification.dart';
import 'package:shiftsync/presentation/widgets/background_stack.dart';
import 'package:shiftsync/presentation/widgets/sign_in_text_form_field.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordFirstController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Debouncer debouncer = Debouncer(milliseconds: 1000);
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
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text('Please fill the credentials'),
                  ),
                ],
              ),
              Form(
                key: _formKey,
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
                        formKey: _formKey,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: CupertinoIcons.mail,
                        hintText: 'e-mail',
                        suffix: null,
                        obscureText: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        formKey: _formKey,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: Iconsax.call,
                        hintText: 'Phone Number',
                        suffix: null,
                        obscureText: false,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        formKey: _formKey,
                      ),
                      kHeightTen,
                      SignInTextFormField(
                        icon: Iconsax.user,
                        hintText: 'User Name',
                        suffix: null,
                        obscureText: false,
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                        formKey: _formKey,
                      ),
                      kHeightTen,
                      BlocProvider(
                        create: (context) => PasswordVisibilityCubit(),
                        child: SizedBox(
                          child: BlocBuilder<PasswordVisibilityCubit,
                              PasswordVisibilityState>(
                            builder: (context, state) {
                              return SignInTextFormField(
                                onChanged: (password) {
                                  debouncer.run(() {
                                    context
                                        .read<ConfirmPasswordCubit>()
                                        .setpasswordState(password);
                                  });
                                },
                                icon: Iconsax.key_square,
                                hintText: 'Password',
                                suffix: InkWell(
                                  onTap: () {
                                    context
                                        .read<PasswordVisibilityCubit>()
                                        .visiblepassword();
                                  },
                                  child: Icon(
                                    state.showPassword
                                        ? Iconsax.eye
                                        : Iconsax.eye_slash,
                                    color: iconBlackColor,
                                  ),
                                ),
                                obscureText: state.showPassword,
                                controller: passwordFirstController,
                                keyboardType: TextInputType.visiblePassword,
                                formKey: _formKey,
                              );
                            },
                          ),
                        ),
                      ),
                      kHeightTen,
                      BlocProvider(
                        create: (context) => PasswordVisibilityCubit(),
                        child: SizedBox(
                          child: BlocBuilder<PasswordVisibilityCubit,
                              PasswordVisibilityState>(
                            builder: (context, state) {
                              return SignInTextFormField(
                                onChanged: (confirmPassword) {
                                  debouncer.run(() {
                                    context
                                        .read<ConfirmPasswordCubit>()
                                        .checkPassword(confirmPassword);
                                  });
                                },
                                icon: Iconsax.key_square,
                                hintText: 'Confirm Password',
                                suffix: InkWell(
                                  onTap: () {
                                    context
                                        .read<PasswordVisibilityCubit>()
                                        .visiblepassword();
                                  },
                                  child: Icon(
                                    state.showPassword
                                        ? Iconsax.eye
                                        : Iconsax.eye_slash,
                                    color: iconBlackColor,
                                  ),
                                ),
                                obscureText: state.showPassword,
                                controller: passwordConfirmController,
                                keyboardType: TextInputType.visiblePassword,
                                formKey: _formKey,
                              );
                            },
                          ),
                        ),
                      ),
                      kHeightFive,
                      SizedBox(
                        width: double.infinity,
                        height: 20,
                        child: BlocBuilder<ConfirmPasswordCubit,
                            ConfirmPasswordState>(
                          builder: (context, state) {
                            if (state.status == 1) {
                              return const Text(
                                ' ✅ Passwords are same',
                                style: TextStyle(color: Colors.green),
                              );
                            } else if (state.status == 2) {
                              return const Text(
                                ' ❌ Password and Confirm password are not same',
                                style: TextStyle(color: Colors.red),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                      kheightTwenty,
                      SubmitButton(
                          buttonWidth: 0.8,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((ctx) => OtpVerificationScreen(
                                        otpMessage:
                                            'We need to verify your phone number \n +91${phoneController.text}\nbefore getting started',
                                        onCompleted: (p0) {
                                          Navigator.of(context)
                                              .pushNamed('/home_screen');
                                        },
                                      ))));
                            }
                          },
                          label: 'Sign Up'),
                      kheightTwenty,
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/sign_in');
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
