import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shiftsync/bussiness_logic/blocs/complete_profile_screen/complete_profile_screen_bloc.dart';
import 'package:shiftsync/data/models/profile_form_model/profile_form_model.dart';
import 'package:shiftsync/util/alert_popup_functions/sumbitting_alert.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/util/constants/constants.dart';
import 'package:shiftsync/util/dependancy_injection/dependancy_injection.dart';
import 'package:shiftsync/util/enums/complete_profile_enums.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/bank_account_details.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/comunication_details.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/job_details.dart';
import 'package:shiftsync/presentation/screens/complete_profile_details_screen.dart/widgets/other_details.dart';
import 'package:shiftsync/presentation/widgets/title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_appbar/custom_app_bar.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';

import 'widgets/form_submit_message.dart';

String? newImage;

class CompleteProfileDetailsScreen extends StatelessWidget {
  const CompleteProfileDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CompleteProfileScreenBloc cpsb = locator<CompleteProfileScreenBloc>();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child:
          BlocListener<CompleteProfileScreenBloc, CompleteProfileScreenState>(
        listener: (context, state) {
          log(state.runtimeType.toString());
          if (state.isLoading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) =>
                  const SubmitAlert(nextScreen: FormSubmitMessage()),
            );
          }
        },
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                title: const Text(
                  'Complete your profile',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                appBarColor: Colors.white,
                leading: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/home_screen');
                    },
                    child: const Icon(Iconsax.arrow_left_2)),
              )),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: cpsb.formKey,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BoldTitleText(title: '1. Personal Details'),
                      kheightTwenty,
                      kHeightFive,
                      Row(
                        children: [
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
                                      cpsb.gender = state.gender;
                                    }
                                  },
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        Radio(
                                          value: Gender.male,
                                          groupValue: cpsb.gender,
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    CompleteProfileScreenBloc>()
                                                .add(GenderChangeEvent(
                                                    gender: value!));
                                          },
                                        ),
                                        const Text('Male'),
                                        Radio(
                                          value: Gender.female,
                                          groupValue: cpsb.gender,
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    CompleteProfileScreenBloc>()
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
                                      cpsb.maritalStatus = state.maritalStatus;
                                    }
                                  },
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        Radio(
                                          value: MaritalStatus.single,
                                          groupValue: cpsb.maritalStatus,
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    CompleteProfileScreenBloc>()
                                                .add(MaritalStatusChangeEvent(
                                                    maritalStatus: value!));
                                          },
                                        ),
                                        const Text('Single'),
                                        Radio(
                                          value: MaritalStatus.married,
                                          groupValue: cpsb.maritalStatus,
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    CompleteProfileScreenBloc>()
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
                      CustomTextFormField(
                        onTap: () async {
                          final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1975),
                              lastDate: DateTime.now());
                          if (date != null) {
                            DateFormat dateFormat = DateFormat('dd-MM-yyyy');
                            cpsb.dateController.text = dateFormat.format(date);
                          }
                        },
                        keyboardType: TextInputType.none,
                        controller: cpsb.dateController,
                        labelText: 'Date of Birth',
                        suffuxIcon: const Icon(Iconsax.calendar),
                      ),
                    ],
                  ),
                  JobDetails(
                    desigController: cpsb.desigController,
                  ),
                  CommunicationDetails(
                      communicationController: cpsb.communicationController,
                      permenentController: cpsb.permenentController),
                  BankAccountDetailsSection(
                      accNoController: cpsb.accNoController,
                      ifscController: cpsb.ifscController,
                      nameAspassbookController: cpsb.nameAspassbookController),
                  OtherDetails(
                      aadharController: cpsb.aadharController,
                      panController: cpsb.panController),
                  kHeightTen,
                  const Text(
                      '* Please verify all detials before clicking submit button'),
                  kHeightTen,
                  SubmitButton(
                    onPressed: () {
                      if (cpsb.formKey.currentState!.validate()) {
                        if (cpsb.gender == null) {
                          log('select gender');
                        } else if (cpsb.maritalStatus == null) {
                          log('select marital status ');
                        } else {
                          ProfileFormModel profileFormModel = ProfileFormModel(
                            gender: (cpsb.gender == Gender.male) ? 'm' : 'f',
                            maritalstatus:
                                (cpsb.maritalStatus == MaritalStatus.single)
                                    ? 's'
                                    : 'm',
                            dateofbirth: cpsb.dateController.text,
                            paddress: cpsb.permenentController.text,
                            caddress: cpsb.communicationController.text,
                            accno: cpsb.accNoController.text,
                            ifsccode: cpsb.ifscController.text,
                            nameinpass: cpsb.nameAspassbookController.text,
                            pannumber: cpsb.panController.text,
                            adhaarno: cpsb.aadharController.text,
                            designation: cpsb.desigController.text,
                            photo: 'no_photo',
                          );
                          cpsb.dateController.clear();
                          cpsb.communicationController.clear();
                          cpsb.permenentController.clear();
                          cpsb.accNoController.clear();
                          cpsb.ifscController.clear();
                          cpsb.nameAspassbookController.clear();
                          cpsb.aadharController.clear();
                          cpsb.panController.clear();
                          cpsb.desigController.clear();
                          cpsb.gender = null;
                          cpsb.maritalStatus = null;
                          context.read<CompleteProfileScreenBloc>().add(
                                ProfileFormSubmitEvent(
                                  profileFormModel: profileFormModel,
                                ),
                              );
                        }
                      }
                    },
                    label: 'Submit',
                    buttonWidth: size.width * 0.8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
