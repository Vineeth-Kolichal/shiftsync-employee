// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryHistoryModel _$SalaryHistoryModelFromJson(Map<String, dynamic> json) =>
    SalaryHistoryModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      salaryHistory: (json['Salary History'] as List<dynamic>?)
              ?.map((e) => SalaryHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SalaryHistoryModelToJson(SalaryHistoryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Salary History': instance.salaryHistory,
    };
