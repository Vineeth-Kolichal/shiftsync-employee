import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync/bussiness_logic/blocs/dashboard/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardResponseState) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  (state.dashboardModel.message == '')
                      ? 'Please complete profile registrations\n before getting started'
                      : '${state.dashboardModel.message}',
                  textAlign: TextAlign.center,
                )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/complete_profile');
                    },
                    child: const Text('fill form again'))
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
      },
    );
  }
}
