import 'package:flutter/material.dart';
import 'package:shiftsync/data/models/leave_status_history_model/leave_status_history.dart';
import 'package:shiftsync/presentation/widgets/bold_content_text.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/colors/background_colors.dart';

class LeaveHistoryTile extends StatelessWidget {
  const LeaveHistoryTile({
    super.key,
    required this.leaveStatusHistory,
  });
  final LeaveStatusHistory leaveStatusHistory;
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
                      const TitileText(
                        title: 'Leave type: ',
                      ),
                      BoldContentText(content: leaveStatusHistory.leavetype!)
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                      color: (leaveStatusHistory.status == 'Approved')
                          ? Colors.green
                          : (leaveStatusHistory.status == 'Pending')
                              ? customPrimaryColor
                              : Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      leaveStatusHistory.status ?? 'status',
                      style: const TextStyle(
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
                      const TitileText(title: 'From Date'),
                      BoldContentText(
                          content: leaveStatusHistory.fromdate ?? 'From date')
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.1,
                  child: const VerticalDivider(
                    color: customPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(children: [
                    const TitileText(title: 'To date'),
                    BoldContentText(
                        content: leaveStatusHistory.todate ?? 'to date')
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
