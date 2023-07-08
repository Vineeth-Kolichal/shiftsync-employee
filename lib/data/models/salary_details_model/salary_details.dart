import 'package:json_annotation/json_annotation.dart';

part 'salary_details.g.dart';

@JsonSerializable()
class SalaryDetails {
  int? basesalary;
  int? bonus;
  int? dallowance;
  String? grade;
  int? grosssalary;
  @JsonKey(name: 'leave_pay')
  int? leavePay;
  int? mallowance;
  int? netsalary;
  int? overtime;
  int? provident;
  int? spallowance;
  int? tax;

  SalaryDetails({
    this.basesalary,
    this.bonus,
    this.dallowance,
    this.grade,
    this.grosssalary,
    this.leavePay,
    this.mallowance,
    this.netsalary,
    this.overtime,
    this.provident,
    this.spallowance,
    this.tax,
  });

  factory SalaryDetails.fromJson(Map<String, dynamic> json) {
    return _$SalaryDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalaryDetailsToJson(this);
}
