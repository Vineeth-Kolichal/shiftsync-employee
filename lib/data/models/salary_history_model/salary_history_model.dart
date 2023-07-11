import 'package:json_annotation/json_annotation.dart';

import 'salary_history.dart';

part 'salary_history_model.g.dart';

@JsonSerializable()
class SalaryHistoryModel {
  int? status;
  String? message;
  @JsonKey(name: 'Salary History')
  List<SalaryHistory> salaryHistory;

  SalaryHistoryModel({this.status, this.message, this.salaryHistory=const []});

  factory SalaryHistoryModel.fromJson(Map<String, dynamic> json) {
    return _$SalaryHistoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalaryHistoryModelToJson(this);
}
