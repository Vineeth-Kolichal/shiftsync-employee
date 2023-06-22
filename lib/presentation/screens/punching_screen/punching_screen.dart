import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/util/constants/constants.dart';

class PunchingScreen extends StatelessWidget {
  const PunchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            appBarColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const SizedBox(
                height: 30,
                width: 30,
                child: Icon(Iconsax.arrow_left_2),
              ),
            ),
            title: Image.asset(
              'assets/images/title.png',
              width: size.width * 0.4,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: size.width * 0.5,
              width: size.width,
              child: LottieBuilder.asset(
                'assets/lottie_jsons/attendence.json',
                height: size.width * 0.5,
                width: size.width * 0.7,
              ),
            ),
            Container(
              height: size.width * 0.5,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitileText(title: 'Time:'),
                      kWidthFive,
                      Text('09:00am'),
                    ],
                  ),
                  kHeightTen,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitileText(title: 'Duty:'),
                      kWidthFive,
                      Text('Morning shift')
                    ],
                  ),
                  kHeightTen,
                  SubmitButton(
                    onPressed: () {},
                    label: 'Punch in',
                    buttonWidth: 0.5,
                    backgroundColor: Colors.green,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
