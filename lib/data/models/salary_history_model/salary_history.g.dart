// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryHistory _$SalaryHistoryFromJson(Map<String, dynamic> json) =>
    SalaryHistory(
      allowance: json['allowance'] as int?,
      date: json['date'] as String?,
      deductions: json['deductions'] as int?,
      grossSalary: json['gross_salary'] as int?,
      netSalary: json['net_salary'] as int?,
      rerenceId: json['rerence_id'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$SalaryHistoryToJson(SalaryHistory instance) =>
    <String, dynamic>{
      'allowance': instance.allowance,
      'date': instance.date,
      'deductions': instance.deductions,
      'gross_salary': instance.grossSalary,
      'net_salary': instance.netSalary,
      'rerence_id': instance.rerenceId,
      'time': instance.time,
    };
