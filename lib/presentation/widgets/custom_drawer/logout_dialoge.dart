import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/bussiness_logic/cubits/logout/logout_cubit.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/constants/shared_preference_key_names.dart';

void logout(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutResponseState &&
                state.logoutResponseModel.status == 200) {
              Future.delayed(const Duration(microseconds: 1000), () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/sign_in', (route) => false);
              });
            }
          },
          builder: (context, state) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: const Text('Confirm Logout'),
              content: (state is LogoutLoading)
                  ? LoadingAnimationWidget.inkDrop(
                      color: customPrimaryColor,
                      size: 25,
                    )
                  : (state is LogoutResponseState)
                      ? Text(state.logoutResponseModel.message ?? '  ')
                      : const Text('Are you sure want to logout'),
              actions: [
                ElevatedButton(
                  onPressed: (state is LogoutLoading)
                      ? null
                      : () {
                          Navigator.of(ctx).pop();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: customPrimaryColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: customPrimaryColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: (state is LogoutLoading)
                      ? null
                      : () async {
                          await context.read<LogoutCubit>().logout();
                          final shared = await SharedPreferences.getInstance();
                          await shared.remove(pin);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: customPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          },
        );
      });
}
