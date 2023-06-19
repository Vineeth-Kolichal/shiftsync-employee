import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/blocs/otp_verification/otp_verification_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/sign_up/sign_up_bloc.dart';
import 'package:shiftsync/bussiness_logic/cubits/confirm_password/confirm_password_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/colors/common_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/util/debouncer/debouncer.dart';
import 'package:shiftsync/data/models/otp_model/otp.dart';
import 'package:shiftsync/data/models/sign_up_model/sign_up.dart';
import 'package:shiftsync/presentation/screens/otp_verification_screen/screen_otp_verification.dart';
import 'package:shiftsync/presentation/widgets/background_stack.dart';
import 'package:shiftsync/presentation/widgets/sign_in_text_form_field.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordFirstController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Debouncer debouncer = Debouncer(milliseconds: 1000);
    Size size = MediaQuery.of(context).size;
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpResponseState) {
          if (state.signUpResponseModel.status == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 1000),
                backgroundColor: Colors.green,
                content: Text(toBeginningOfSentenceCase(
                        state.signUpResponseModel.message) ??
                    'Otp sent'),
              ),
            );
            Future.delayed(const Duration(milliseconds: 1500), () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((ctx) => OtpVerificationScreen(
                        nextRoute: '/sign_in',
                        otpMessage:
                            'We need to verify your phone number \n +91${phoneController.text}\nbefore getting started',
                        onCompleted: (otp) {
                          context
                              .read<OtpVerificationBloc>()
                              .add(VerifySignUpOtp(otp: OtpModel(otp: otp)));
                        },
                      ))));
            });
          } else if (state.signUpResponseModel.status == 404) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Something went wrong'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(toBeginningOfSentenceCase(
                        state.signUpResponseModel.message) ??
                    'Something error'),
              ),
            );
          }
        }
      },
      child: Scaffold(
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
                          hintText: 'First Name',
                          controller: firstNameController,
                          keyboardType: TextInputType.text,
                          formKey: _formKey,
                        ),
                        kHeightTen,
                        SignInTextFormField(
                          icon: Iconsax.user,
                          hintText: 'Last Name',
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          formKey: _formKey,
                        ),
                        kHeightTen,
                        SignInTextFormField(
                          icon: CupertinoIcons.mail,
                          hintText: 'e-mail',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          formKey: _formKey,
                        ),
                        kHeightTen,
                        SignInTextFormField(
                          icon: Iconsax.call,
                          hintText: 'Phone Number',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
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
                                    _formKey.currentState?.validate();
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
                                    _formKey.currentState?.validate();
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
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            if (state.isLoading) {
                              return LoadingAnimationWidget.inkDrop(
                                color: customPrimaryColor,
                                size: 25,
                              );
                            }
                            return SubmitButton(
                                buttonWidth: 0.8,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<SignUpBloc>().add(
                                          EmployeeSignUp(
                                            signUpModel: SignUpModel(
                                              firstname: firstNameController
                                                  .text
                                                  .trim(),
                                              lastname: lastNameController.text
                                                  .trim(),
                                              email:
                                                  emailController.text.trim(),
                                              phone: int.parse(
                                                  '91${phoneController.text.trim()}'),
                                              username:
                                                  emailController.text.trim(),
                                              password:
                                                  passwordConfirmController.text
                                                      .trim(),
                                            ),
                                          ),
                                        );
                                  }
                                },
                                label: 'Sign Up');
                          },
                        ),
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
      ),
    );
  }
}
