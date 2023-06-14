import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/blocs/sign_in/sign_in_bloc.dart';
import 'package:shiftsync/bussiness_logic/cubits/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:shiftsync/bussiness_logic/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:shiftsync/core/api_response_type/api_respose_result_type.dart';
import 'package:shiftsync/core/colors/common_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/data/models/sign_in_authentication_model/sign_in_authentication.dart';
import 'package:shiftsync/presentation/widgets/background_stack.dart';
import 'package:shiftsync/presentation/widgets/sign_in_text_form_field.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<InternetConnectionCheckCubit,
        InternetConnectionCheckState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          log('Internet is connected');
        } else {
          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text('No internet'),
                  content: const Text(
                      'Please turn on mobile data or connect to a wifi'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('Close'))
                  ],
                );
              });

          log('internet is disconnected');
        }
      },
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInResult) {
            if (state.responseType == ApiResponseResultType.clientError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Incorrect User name or Password'),
                ),
              );
            } else if (state.responseType ==
                ApiResponseResultType.serverError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Something went wrong'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  backgroundColor: Colors.green,
                  content: Text('logined successyfully'),
                ),
              );
              Future.delayed(const Duration(milliseconds: 1500), () {
                Navigator.of(context).pushReplacementNamed('/home_screen');
              });
            }
          }
        },
        child: Scaffold(
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
                  const Text('Sign In to'),
                  kHeightFive,
                  Image.asset(
                    'assets/images/title.png',
                    width: size.width * 0.4,
                  ),
                  kheightTwenty,
                  const Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                            keyboardType: TextInputType.name,
                            controller: userNameController,
                            obscureText: false,
                            icon: Iconsax.user,
                            hintText: 'User name',
                            suffix: null,
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
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    formKey: _formKey,
                                  );
                                },
                              ),
                            ),
                          ),
                          kHeightTen,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Forget Password?'),
                            ],
                          ),
                          kheightTwenty,
                          BlocBuilder<SignInBloc, SignInState>(
                            builder: (context, state) {
                              return SubmitButton(
                                buttonWidth: 0.8,
                                label: 'Sing In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<SignInBloc>().add(
                                          EmployeeSignIn(
                                            signInAuthenticationModel:
                                                SignInAuthenticationModel(
                                              username: userNameController.text
                                                  .trim(),
                                              password: passwordController.text
                                                  .trim(),
                                            ),
                                          ),
                                        );
                                  }
                                },
                              );
                            },
                          ),
                          kHeightTen,
                          const Text("Don't you have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/sign_up');
                              },
                              child: const Text('Sign Up'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
