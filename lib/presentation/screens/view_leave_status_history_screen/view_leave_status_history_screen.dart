import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/util/colors/background_colors.dart';

class ViewLeaveStatusHistoryScreen extends StatelessWidget {
  const ViewLeaveStatusHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: Icon(
                    Iconsax.arrow_2,
                  ),
                ),
              ),
            ),
            appBarColor: appBarColor),
      ),
      body: Center(
        child: Text('view status'),
      ),
    );
  }
}
