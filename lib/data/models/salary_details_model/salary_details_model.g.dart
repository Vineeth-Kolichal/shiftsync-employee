// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryDetailsModel _$SalaryDetailsModelFromJson(Map<String, dynamic> json) =>
    SalaryDetailsModel(
      status: json['status'] as int?,
      salaryDetails: json['Salary Details'] == null
          ? null
          : SalaryDetails.fromJson(
              json['Salary Details'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SalaryDetailsModelToJson(SalaryDetailsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'Salary Details': instance.salaryDetails,
      'message': instance.message,
    };
