import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shiftsync/data/models/profile_form_model/profile_form_model.dart';
import 'package:shiftsync/data/models/profile_form_response_model/profile_form_response_model.dart';
import 'package:shiftsync/data/repositories/profile_form_repository/profile_form_repository.dart';

import 'package:shiftsync/util/enums/complete_profile_enums.dart';

part 'complete_profile_screen_event.dart';
part 'complete_profile_screen_state.dart';

class CompleteProfileScreenBloc
    extends Bloc<CompleteProfileScreenEvent, CompleteProfileScreenState> {
  ProfileFormRepository profileFormRepository = ProfileFormRepository();
  CompleteProfileScreenBloc() : super(CompleteProfileScreenInitial()) {
    on<GenderChangeEvent>(
        (event, emit) => emit(GenderChangeState(gender: event.gender)));
    on<MaritalStatusChangeEvent>((event, emit) =>
        emit(MaritalStatusChangeState(maritalStatus: event.maritalStatus)));
    on<ProfileFormSubmitEvent>((event, emit) async {
      emit(ProfileFormSubmitLoading());
      ProfileFormResponseModel responseModel = await profileFormRepository
          .profileFormSubmit(profileForm: event.profileFormModel);
      emit(ProfileFormSubmitRespState(
          profileFormResponseModel: responseModel, isLoading: false));
    });
  }
}
