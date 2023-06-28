import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shiftsync/data/models/profile_form_model/profile_form_model.dart';
import 'package:shiftsync/data/models/profile_form_response_model/profile_form_response_model.dart';
import 'package:shiftsync/data/repositories/profile_form_repository/profile_form_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/util/enums/complete_profile_enums.dart';

part 'complete_profile_screen_event.dart';
part 'complete_profile_screen_state.dart';

@Injectable()
class CompleteProfileScreenBloc
    extends Bloc<CompleteProfileScreenEvent, CompleteProfileScreenState> {
  //Text editingcontrollers used in complete profile screen
  TextEditingController dateController = TextEditingController();
  TextEditingController communicationController = TextEditingController();
  TextEditingController permenentController = TextEditingController();
  TextEditingController accNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController nameAspassbookController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController desigController = TextEditingController();
  ProfileFormRepository profileFormRepository = ProfileFormRepository();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MaritalStatus? maritalStatus;
  Gender? gender;

  CompleteProfileScreenBloc() : super(CompleteProfileScreenInitial()) {
    on<GenderChangeEvent>(
        (event, emit) => emit(GenderChangeState(gender: event.gender)));
    on<MaritalStatusChangeEvent>((event, emit) =>
        emit(MaritalStatusChangeState(maritalStatus: event.maritalStatus)));
    on<ProfileFormSubmitEvent>((event, emit) async {
      emit(ProfileFormSubmitLoading());
      await disposeTextEcontrollers();
      ProfileFormResponseModel responseModel = await profileFormRepository
          .profileFormSubmit(profileForm: event.profileFormModel);

      emit(ProfileFormSubmitRespState(
          profileFormResponseModel: responseModel, isLoading: false));
    });
  }
  Future<void> disposeTextEcontrollers() async {
    log('is it working');
    dateController.clear();
    communicationController.clear();
    permenentController.clear();
    accNoController.clear();
    ifscController.clear();
    nameAspassbookController.clear();
    aadharController.clear();
    panController.clear();
    desigController.clear();
  }

  @override
  Future<void> close() {
    log('is it working');
    dateController.dispose();
    communicationController.dispose();
    permenentController.dispose();
    accNoController.dispose();
    ifscController.dispose();
    nameAspassbookController.dispose();
    aadharController.dispose();
    panController.dispose();
    desigController.dispose();
    return super.close();
  }
}
