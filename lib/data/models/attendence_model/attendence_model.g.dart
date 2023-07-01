// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendenceModel _$AttendenceModelFromJson(Map<String, dynamic> json) =>
    AttendenceModel(
      attendance: (json['Attendance'] as List<dynamic>?)
          ?.map((e) => Attendance.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$AttendenceModelToJson(AttendenceModel instance) =>
    <String, dynamic>{
      'Attendance': instance.attendance,
      'status': instance.status,
    };
