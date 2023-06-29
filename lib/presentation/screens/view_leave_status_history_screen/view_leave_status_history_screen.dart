import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/presentation/widgets/bold_content_text.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class ViewLeaveStatusHistoryScreen extends StatelessWidget {
  const ViewLeaveStatusHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SafeArea(
            child: CustomAppBar(
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Icon(
                        Iconsax.arrow_left_2,
                      ),
                    ),
                  ),
                ),
                title: BoldTitleText(title: 'Leave Status/History'),
                appBarColor: appBarColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return LeaveHistoryTile();
              },
              separatorBuilder: (ctx, index) {
                return kHeightTen;
              },
              itemCount: 20),
        ));
  }
}

class LeaveHistoryTile extends StatelessWidget {
  const LeaveHistoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      TitileText(
                        title: 'Leave type: ',
                      ),
                      BoldContentText(content: 'Personal')
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      'Approved',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: customPrimaryColor,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(
                    children: [
                      TitileText(title: 'From Date'),
                      BoldContentText(content: '12-07-2023')
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.1,
                  child: VerticalDivider(
                    color: customPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(children: [
                    TitileText(title: 'To date'),
                    BoldContentText(content: '12-07-2023')
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
