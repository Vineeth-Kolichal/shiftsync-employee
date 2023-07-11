part of 'salary_transaction_history_bloc.dart';

@freezed
class SalaryTransactionHistoryEvent with _$SalaryTransactionHistoryEvent {
  const factory SalaryTransactionHistoryEvent.getHistory() = GetHistory;
}