// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart';
import 'package:shiftsync/core/colors/background_colors.dart';
import 'package:shiftsync/core/constants/constants.dart';
import 'package:shiftsync/core/enums/complete_profile_enums.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';

class PersonalinformationSection extends StatelessWidget {
  PersonalinformationSection(
      {super.key, this.gender, this.maritalStatus, this.newImage,required this.dateController});
  Gender? gender;
  MaritalStatus? maritalStatus;
  String? newImage;
  TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
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
                    context
                        .read<CompleteProfileScreenBloc>()
                        .add(UploadImageEvent());
                  },
                  child: BlocBuilder<CompleteProfileScreenBloc,
                      CompleteProfileScreenState>(
                    builder: (context, state) {
                      if (state is UploadPhotoState) {
                        newImage = state.image;
                      }
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
                  ),
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
                                  .add(GenderChangeEvent(gender: value!));
                            },
                          ),
                          const Text('Male'),
                          Radio(
                            value: Gender.female,
                            groupValue: gender,
                            onChanged: (value) {
                              context
                                  .read<CompleteProfileScreenBloc>()
                                  .add(GenderChangeEvent(gender: value!));
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
                              context.read<CompleteProfileScreenBloc>().add(
                                  MaritalStatusChangeEvent(
                                      maritalStatus: value!));
                            },
                          ),
                          const Text('Single'),
                          Radio(
                            value: MaritalStatus.married,
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              context.read<CompleteProfileScreenBloc>().add(
                                  MaritalStatusChangeEvent(
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
          controller: dateController,
          labelText: 'Date of Birth',
          suffuxIcon: const Icon(Iconsax.calendar),
        ),
      ],
    );
  }
}
