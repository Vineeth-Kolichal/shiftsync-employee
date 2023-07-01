// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      date: json['date'] as String?,
      timein: json['timein'] as String?,
      timeout: json['timeout'] as String?,
      dutytype: json['dutytype'] as String?,
      totalhour: json['totalhour'] as int?,
      overtime: json['overtime'] as int?,
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'date': instance.date,
      'timein': instance.timein,
      'timeout': instance.timeout,
      'dutytype': instance.dutytype,
      'totalhour': instance.totalhour,
      'overtime': instance.overtime,
    };
