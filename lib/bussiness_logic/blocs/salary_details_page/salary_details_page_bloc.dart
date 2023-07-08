
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/salary_details_model/salary_details_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';

part 'salary_details_page_event.dart';
part 'salary_details_page_state.dart';
part 'salary_details_page_bloc.freezed.dart';

@injectable
class SalaryDetailsPageBloc
    extends Bloc<SalaryDetailsPageEvent, SalaryDetailsPageState> {
  GetSalaryDetailsRepository detailsRepository;
  SalaryDetailsPageBloc(this.detailsRepository)
      : super(SalaryDetailsPageState.loading()) {
    on<GetDetails>((event, emit) async {
      emit(SalaryDetailsPageState.loading());
      SalaryDetailsModel detailsModel =
          await detailsRepository.getSalaryDetails();
      emit(state.copyWith(salaryDetailsModel: detailsModel, isLoading: false));
    });
  }
}
