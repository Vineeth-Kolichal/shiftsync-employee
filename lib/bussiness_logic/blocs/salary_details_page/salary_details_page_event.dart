part of 'salary_details_page_bloc.dart';

@freezed
class SalaryDetailsPageEvent with _$SalaryDetailsPageEvent {
  const factory SalaryDetailsPageEvent.getDetails() = GetDetails;
}