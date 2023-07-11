part of 'salary_transaction_history_bloc.dart';

@freezed
class SalaryTransactionHistoryState with _$SalaryTransactionHistoryState {
  const factory SalaryTransactionHistoryState({
    required bool isLoading,
    SalaryHistoryModel? salaryHistoryModel,
  }) = _Initial;
  factory SalaryTransactionHistoryState.Loading() =>
      SalaryTransactionHistoryState(isLoading: true);
}
