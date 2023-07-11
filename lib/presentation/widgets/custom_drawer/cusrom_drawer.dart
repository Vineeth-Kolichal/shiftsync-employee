import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftsync/presentation/screens/privacy_policy_screen/privacy_privacy_screen.dart.dart';
import 'package:shiftsync/util/constants/shared_preference_key_names.dart';
import 'package:shiftsync/presentation/screens/pin_validation_screen/pin_validation_screen.dart';
import 'package:shiftsync/presentation/widgets/custom_drawer/logout_dialoge.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(),
                  const Text(
                    'Made with 💙 by Vineeth',
                    style: TextStyle(fontSize: 11),
                  ),
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (BuildContext context,
                        AsyncSnapshot<PackageInfo> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          'Version: ${snapshot.data!.version}',
                          style: const TextStyle(fontSize: 11),
                        );
                      } else {
                        return const Text(
                          'Version Loading...',
                          style: TextStyle(fontSize: 11),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        ListView(
          children: [
            DrawerHeader(
                child: Center(
              child: Image.asset('assets/images/shiftsync.png'),
            )),
            ListTile(
              leading: const Icon(Iconsax.lock_1),
              title: const Text('Set/Reset PIN'),
              onTap: () async {
                SharedPreferences shared =
                    await SharedPreferences.getInstance();
                final pinValue = shared.getString(pin);
                if (pinValue == null) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed('/set_pin');
                } else {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((ctx) =>
                          const PinValidationScreen(routeName: '/set_pin'))));
                }
              },
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (((context) => PrivacyPolicyScreen()))));
                // await launchUrl(Uri.https('vineeth-kolichal.github.io',
                //     '/shiftsync-privacy-policy/'));
              },
              leading: const Icon(Iconsax.document),
              title: const Text('Privacy policy'),
            ),
            ListTile(
              leading: const Icon(Iconsax.logout_1),
              title: const Text('Logout'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        )
      ]),
    );
  }
}
