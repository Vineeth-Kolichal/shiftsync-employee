import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shiftsync/data/models/attendence_model/attendance.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/colors/common_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class AttendenceTileWidget extends StatelessWidget {
  const AttendenceTileWidget({
    super.key,
    required this.attendance,
  });
  final Attendance attendance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: attendenceTileColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.02, color: customPrimaryColor)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Text(
                attendance.date ?? 'date',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            kHeightTen,
            Container(
              width: size.width * 0.85,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: customPrimaryColor),
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: linearGradientColors,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.35,
                        child: Column(
                          children: [
                            const TitileText(
                              title: 'Check In',
                              fontSize: 17,
                            ),
                            kHeightTen,
                            Text(
                              DateFormat('hh:mm a').format(
                                  DateFormat('HH:mm:ss')
                                      .parse(attendance.timein ?? '00:00:00')),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: size.width * 0.4,
                        child: Column(
                          children: [
                            const TitileText(title: 'Check Out', fontSize: 17),
                            kHeightTen,
                            Text(
                                DateFormat('hh:mm a').format(
                                    DateFormat('HH:mm:ss').parse(
                                        attendance.timeout ?? '00:00:00')),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            kHeightTen,
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: const TitileText(title: 'More Details'),
                children: <Widget>[
                  Builder(
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.center,
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TitileText(title: 'Duty type:'),
                              Text(attendance.dutytype ?? 'duty type')
                            ],
                          ),
                          kHeightTen,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TitileText(title: 'Total Hour:'),
                              Text('${attendance.totalhour}')
                            ],
                          ),
                          kHeightTen,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TitileText(title: 'Over time:'),
                              Text('${attendance.overtime}')
                            ],
                          )
                        ]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
