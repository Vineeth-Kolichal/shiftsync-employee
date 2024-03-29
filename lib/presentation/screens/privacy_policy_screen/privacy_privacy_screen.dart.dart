import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
              title: const BoldTitleText(title: 'Privacy Policy'),
              appBarColor: appBarColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            BoldTitleText(title: 'Privacy Policy-Shiftsync'),
            Divider(),
            Text(
                'Last updated: July 11, 2023 \n\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.'),
            BoldTitleText(title: 'Interpretation and Definitions'),
            Divider(),
            HeadingAndContent(
                heading: 'Account',
                content:
                    'means a unique account created for You to access our Service or parts of our Service.'),
            HeadingAndContent(
                heading: 'Affiliate',
                content:
                    'means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.'),
            HeadingAndContent(
                heading: 'Application',
                content:
                    'refers to ShiftSync, the software program provided by the Company'),
            HeadingAndContent(
                heading: 'Company',
                content:
                    '(referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to ShiftSync.'),
            HeadingAndContent(
                heading: 'Country', content: 'refers to: Kerala,  India'),
            HeadingAndContent(
                heading: 'Personal Data',
                content:
                    'is any information that relates to an identified or identifiable individual.'),
            HeadingAndContent(
                heading: 'Service Provider',
                content:
                    'means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.'),
            HeadingAndContent(
                heading: 'Usage Data',
                content:
                    'refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).'),
            HeadingAndContent(
                heading: 'You',
                content:
                    'means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.'),
            BoldTitleText(title: 'Collecting and Using Your Personal Data'),
            Divider(),
            HeadingAndContent(
                heading: 'Personal Data',
                content:
                    'While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n>Email address\n>First name and last name\n>Phone number\n>Address, State, Province, ZIP/Postal code, City'),
            HeadingAndContent(
                heading: 'Usage Data',
                content:
                    'Usage Data is collected automatically when using the Service.\n\nUsage Data may include information such as Your Devices Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\n\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.'),
          ],
        ),
      ),
    );
  }
}

class HeadingAndContent extends StatelessWidget {
  const HeadingAndContent({
    super.key,
    required this.heading,
    required this.content,
  });
  final String heading;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightFive,
        Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        kHeightFive,
        Text(content)
      ],
    );
  }
}
