part of 'salary_details_page_bloc.dart';

@freezed
class SalaryDetailsPageState with _$SalaryDetailsPageState {
  const factory SalaryDetailsPageState.initial({
    required bool isLoading,
    SalaryDetailsModel? salaryDetailsModel,
  }) = _Initial;

  factory SalaryDetailsPageState.loading() =>
     const SalaryDetailsPageState.initial(isLoading: true);
}
