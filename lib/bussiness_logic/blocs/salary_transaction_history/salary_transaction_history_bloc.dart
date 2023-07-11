import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftsync/data/models/salary_history_model/salary_history_model.dart';
import 'package:shiftsync/data/repositories/repositories.dart';

part 'salary_transaction_history_event.dart';
part 'salary_transaction_history_state.dart';
part 'salary_transaction_history_bloc.freezed.dart';

@injectable
class SalaryTransactionHistoryBloc
    extends Bloc<SalaryTransactionHistoryEvent, SalaryTransactionHistoryState> {
  SalaryTransactionHistoryRepository historyRepository;
  SalaryTransactionHistoryBloc(this.historyRepository)
      : super(SalaryTransactionHistoryState.Loading()) {
    on<SalaryTransactionHistoryEvent>((event, emit) async {
      emit(SalaryTransactionHistoryState.Loading());
      SalaryHistoryModel salaryHistoryModel =
          await historyRepository.getSalaryTransactionHistory();
      emit(state.copyWith(
          isLoading: false, salaryHistoryModel: salaryHistoryModel));
    });
  }
}
