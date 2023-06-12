import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // color: whiteColor,
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
            DrawerHeader(child: SizedBox()),
            ListTile(
              leading: Icon(Iconsax.lock_1),
              title: Text('Set/Reset PIN'),
              onTap: () {
                Navigator.of(context).pushNamed('/set_pin');
              },
            ),
            ListTile(
              leading: Icon(Iconsax.document),
              title: Text('Privacy policy'),
            ),
            ListTile(
              leading: Icon(Iconsax.logout_1),
              title: Text('Logout'),
            ),
          ],
        )
      ]),
    );
  }
}
