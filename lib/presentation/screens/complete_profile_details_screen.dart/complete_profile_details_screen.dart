// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart';
import 'package:shiftsync/bussiness_logic/cubits/upload_image/upload_image_cubit.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/core/enums/complete_profile_enums.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/bank_account_details.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/comunication_details.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/job_details.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/other_details.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';

String? newImage;

class CompleteProfileDetailsScreen extends StatelessWidget {
  CompleteProfileDetailsScreen({super.key});
  TextEditingController dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MaritalStatus? maritalStatus;
    Gender? gender;
    TextEditingController communicationController = TextEditingController();
    TextEditingController permenentController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: Text(
                'Complete your profile',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              appBarColor: Colors.white,
              leading: Icon(Iconsax.arrow_left_2),
            )),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '1. Personal Details',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  kheightTwenty,
                  kHeightFive,
                  Row(
                    children: [
                      Column(
                        children: [
                          const TitileText(title: 'Upload Photo'),
                          kHeightFive,
                          InkWell(
                            onTap: () {
                              context.read<UploadImageCubit>().uploadImage();
                            },
                            child: ProfileImage(size: size),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: size.width * 0.35,
                        width: size.width * 0.60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitileText(title: 'Gender'),
                            BlocConsumer<CompleteProfileScreenBloc,
                                CompleteProfileScreenState>(
                              listener: (context, state) {
                                if (state is GenderChangeState) {
                                  gender = state.gender;
                                }
                              },
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                      value: Gender.male,
                                      groupValue: gender,
                                      onChanged: (value) {
                                        context
                                            .read<CompleteProfileScreenBloc>()
                                            .add(GenderChangeEvent(
                                                gender: value!));
                                      },
                                    ),
                                    const Text('Male'),
                                    Radio(
                                      value: Gender.female,
                                      groupValue: gender,
                                      onChanged: (value) {
                                        context
                                            .read<CompleteProfileScreenBloc>()
                                            .add(GenderChangeEvent(
                                                gender: value!));
                                      },
                                    ),
                                    const Text('Female')
                                  ],
                                );
                              },
                            ),
                            const TitileText(title: 'Marital Status'),
                            BlocConsumer<CompleteProfileScreenBloc,
                                CompleteProfileScreenState>(
                              listener: (context, state) {
                                if (state is MaritalStatusChangeState) {
                                  maritalStatus = state.maritalStatus;
                                }
                              },
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                      value: MaritalStatus.single,
                                      groupValue: maritalStatus,
                                      onChanged: (value) {
                                        context
                                            .read<CompleteProfileScreenBloc>()
                                            .add(MaritalStatusChangeEvent(
                                                maritalStatus: value!));
                                      },
                                    ),
                                    const Text('Single'),
                                    Radio(
                                      value: MaritalStatus.married,
                                      groupValue: maritalStatus,
                                      onChanged: (value) {
                                        context
                                            .read<CompleteProfileScreenBloc>()
                                            .add(MaritalStatusChangeEvent(
                                                maritalStatus: value!));
                                      },
                                    ),
                                    const Text('Married')
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  kheightTwenty,
                  CustomTextFormFiel(
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1975),
                          lastDate: DateTime.now());
                    },
                    keyboardType: TextInputType.none,
                    controller: dataController,
                    labelText: 'Date of Birth',
                    suffuxIcon: const Icon(Iconsax.calendar),
                  ),
                ],
              ),
              JobDetails(),
              CommunicationDetails(
                  communicationController: communicationController,
                  permenentController: permenentController),
              BankAccountDetailsSection(),
              OtherDetails(),
              kHeightTen,
              Text('* Please verify all detials before clicking submit button'),
              SubmitButton(
                onPressed: () {
                  log('$gender ,$maritalStatus,${dataController.text}');
                },
                label: 'Submit',
                buttonWidth: size.width * 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is UploadImgState) {
          newImage = state.image;
        }
      },
      builder: (context, state) {
        return Container(
          height: size.width * 0.31,
          width: size.width * 0.27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: customPrimaryColor[700]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: (newImage != null)
                ? Image.memory(
                    base64Decode(newImage!),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/user.png',
                    fit: BoxFit.cover,
                  ),
          ),
        );
      },
    );
  }
}
