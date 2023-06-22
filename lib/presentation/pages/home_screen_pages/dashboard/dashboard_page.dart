import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/bussiness_logic/blocs/bloc/dashboard_bloc.dart';
import 'package:shiftsync/bussiness_logic/cubits/internet_connection_check/internet_connection_check_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return BlocListener<InternetConnectionCheckCubit,
          InternetConnectionCheckState>(
        listener: (ctx, state) {
          // if (state is InternetDisconnected) {
          //   Flushbar(
          //     isDismissible: false,
          //     messageColor: Colors.white,
          //     titleColor: Colors.white,
          //     backgroundColor: Colors.red,
          //     flushbarPosition: FlushbarPosition.TOP,
          //     title: 'Connectivity error',
          //     message: 'Please turn on wifi or mobile data',
          //     // duration: const Duration(seconds: 3),
          //   ).show(context);
          // } else {
          //   Navigator.of(context).pop();
          // }
        },
        child: BlocBuilder<InternetConnectionCheckCubit,
            InternetConnectionCheckState>(
          builder: (context, state) {
            if (state is InternetDisconnected) {
              return SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(
                      'assets/lottie_jsons/no-internet.json',
                      height: size.width * 0.5,
                    ),
                    Text(
                      'Internet connection lost!',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                    Text('Please turn on mobile data or wifi')
                  ],
                ),
              );
            }
            return BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardResponseState) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('${state.dashboardModel.message}')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/complete_profile');
                            },
                            child: Text('fill form again'))
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                }
              },
            );
          },
        ),
      );
    });
  }
}
