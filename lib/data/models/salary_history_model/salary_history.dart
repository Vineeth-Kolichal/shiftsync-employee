import 'package:json_annotation/json_annotation.dart';

part 'salary_history.g.dart';

@JsonSerializable()
class SalaryHistory {
  int? allowance;
  String? date;
  int? deductions;
  @JsonKey(name: 'gross_salary')
  int? grossSalary;
  @JsonKey(name: 'net_salary')
  int? netSalary;
  @JsonKey(name: 'rerence_id')
  String? rerenceId;
  String? time;

  SalaryHistory({
    this.allowance,
    this.date,
    this.deductions,
    this.grossSalary,
    this.netSalary,
    this.rerenceId,
    this.time,
  });

  factory SalaryHistory.fromJson(Map<String, dynamic> json) {
    return _$SalaryHistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalaryHistoryToJson(this);
}
