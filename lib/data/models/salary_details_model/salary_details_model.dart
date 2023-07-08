import 'package:json_annotation/json_annotation.dart';

import 'salary_details.dart';

part 'salary_details_model.g.dart';

@JsonSerializable()
class SalaryDetailsModel {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'Salary Details')
  SalaryDetails? salaryDetails;
  @JsonKey(name: 'message')
  String? message;

  SalaryDetailsModel({this.status, this.salaryDetails, this.message});

  factory SalaryDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$SalaryDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalaryDetailsModelToJson(this);
}
