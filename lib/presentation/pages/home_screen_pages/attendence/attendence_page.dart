import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/colors/common_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class AttendencePage extends StatelessWidget {
  const AttendencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: const BoldTitleText(title: 'Attendence'),
          ),
          kHeightTen,
          Expanded(
            child: ListView.separated(
                itemBuilder: (ctx, index) {
                  return AttendenceTileWidget();
                },
                separatorBuilder: (ctx, index) {
                  return kHeightTen;
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}

class AttendenceTileWidget extends StatelessWidget {
  const AttendenceTileWidget({
    super.key,
  });

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
                'June 20,2023',
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
                  height: size.width * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.35,
                        child: Column(
                          children: [
                            TitileText(
                              title: 'Check In',
                              fontSize: 17,
                            ),
                            kHeightTen,
                            Text(
                              '09:00 am',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: size.width * 0.4,
                        child: Column(
                          children: [
                            TitileText(title: 'Check Out', fontSize: 17),
                            kHeightTen,
                            Text('05:00 pm',
                                style: TextStyle(
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
                              TitileText(title: 'Duty type:'),
                              Text('Morning')
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
