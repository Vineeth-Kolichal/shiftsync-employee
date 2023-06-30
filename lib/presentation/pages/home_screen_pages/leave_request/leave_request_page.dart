import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shiftsync/bussiness_logic/blocs/leave_request/leave_request_bloc.dart';
import 'package:shiftsync/data/models/leave_request_model/leave_request_model.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/leave_request/widgets/leave_request_response_message.dart';
import 'package:shiftsync/presentation/widgets/bold_title_text.dart';
import 'package:shiftsync/presentation/widgets/custom_textform_field.dart';
import 'package:shiftsync/presentation/widgets/submit_button.dart';
import 'package:shiftsync/util/alert_popup_functions/sumbitting_alert.dart';
import 'package:shiftsync/util/colors/background_colors.dart';
import 'package:shiftsync/util/constants/constants.dart';

class LeaveRequestpage extends StatefulWidget {
  const LeaveRequestpage({super.key});

  @override
  State<LeaveRequestpage> createState() => _LeaveRequestpageState();
}

class _LeaveRequestpageState extends State<LeaveRequestpage> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String leaveTypeSelected = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LeaveRequestBloc, LeaveRequestState>(
      listener: (context, state) {
        if (state is LeaveRequestLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) => const SubmitAlert(
              nextScreen: LeaveRequestResponseMessage(),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BoldTitleText(title: 'Apply for Leave'),
                kHeightTen,
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plase select leave type";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: customPrimaryColor[400]!,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: customPrimaryColor[400]!,
                      ),
                    ),
                  ),
                  hint: const Text('Select leave type'),
                  icon: const Icon(Iconsax.arrow_down_1),
                  borderRadius: BorderRadius.circular(10),
                  items:
                      leaveType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      leaveTypeSelected = value;
                    }
                  },
                ),
                kHeightTen,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.45,
                      child: CustomTextFormField(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (date != null) {
                            DateFormat dateFormat = DateFormat('dd-MM-yyyy');
                            fromDateController.text = dateFormat.format(date);
                          }
                        },
                        keyboardType: TextInputType.none,
                        suffuxIcon: const Icon(Iconsax.calendar),
                        controller: fromDateController,
                        labelText: 'From date',
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.45,
                      child: CustomTextFormField(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (date != null) {
                            DateFormat dateFormat = DateFormat('dd-MM-yyyy');
                            toDateController.text = dateFormat.format(date);
                          }
                        },
                        keyboardType: TextInputType.none,
                        suffuxIcon: const Icon(Iconsax.calendar),
                        controller: toDateController,
                        labelText: 'To date',
                      ),
                    ),
                  ],
                ),
                kHeightTen,
                CustomTextFormField(
                  controller: reasonController,
                  labelText: 'Reason for leave',
                  maxLines: 10,
                ),
                kheightTwenty,
                SizedBox(
                  width: size.width,
                  child: Center(
                    child: SubmitButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LeaveRequestModel leaveRequestModel =
                                LeaveRequestModel(
                                    leavetype: leaveTypeSelected,
                                    fromdate: fromDateController.text,
                                    todate: toDateController.text,
                                    reason: reasonController.text);
                            context.read<LeaveRequestBloc>().add(
                                RequestForLeave(
                                    leaveRequestModel: leaveRequestModel));
                          }
                        },
                        label: 'Submit Application',
                        buttonWidth: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fromDateController.dispose();
    toDateController.dispose();
    reasonController.dispose();
    super.dispose();
  }
}
