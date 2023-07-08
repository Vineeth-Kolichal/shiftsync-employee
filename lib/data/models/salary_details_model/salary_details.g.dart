// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryDetails _$SalaryDetailsFromJson(Map<String, dynamic> json) =>
    SalaryDetails(
      basesalary: json['basesalary'] as int?,
      bonus: json['bonus'] as int?,
      dallowance: json['dallowance'] as int?,
      grade: json['grade'] as String?,
      grosssalary: json['grosssalary'] as int?,
      leavePay: json['leave_pay'] as int?,
      mallowance: json['mallowance'] as int?,
      netsalary: json['netsalary'] as int?,
      overtime: json['overtime'] as int?,
      provident: json['provident'] as int?,
      spallowance: json['spallowance'] as int?,
      tax: json['tax'] as int?,
    );

Map<String, dynamic> _$SalaryDetailsToJson(SalaryDetails instance) =>
    <String, dynamic>{
      'basesalary': instance.basesalary,
      'bonus': instance.bonus,
      'dallowance': instance.dallowance,
      'grade': instance.grade,
      'grosssalary': instance.grosssalary,
      'leave_pay': instance.leavePay,
      'mallowance': instance.mallowance,
      'netsalary': instance.netsalary,
      'overtime': instance.overtime,
      'provident': instance.provident,
      'spallowance': instance.spallowance,
      'tax': instance.tax,
    };
