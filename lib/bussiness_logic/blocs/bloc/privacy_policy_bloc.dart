import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';
part 'privacy_policy_bloc.freezed.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  PrivacyPolicyBloc() : super(const _Initial()) {
    on<PrivacyPolicyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
