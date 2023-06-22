import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import 'package:shiftsync/util/enums/complete_profile_enums.dart';

part 'complete_profile_screen_event.dart';
part 'complete_profile_screen_state.dart';

class CompleteProfileScreenBloc
    extends Bloc<CompleteProfileScreenEvent, CompleteProfileScreenState> {
  CompleteProfileScreenBloc() : super(CompleteProfileScreenInitial()) {
    // on<CompleteProfileScreenEvent>((event, emit) {

    // });
    on<GenderChangeEvent>(
        (event, emit) => emit(GenderChangeState(gender: event.gender)));
    on<MaritalStatusChangeEvent>((event, emit) =>
        emit(MaritalStatusChangeState(maritalStatus: event.maritalStatus)));
  }
}
