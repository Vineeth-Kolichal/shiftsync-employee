// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_duty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDutyModel _$GetDutyModelFromJson(Map<String, dynamic> json) => GetDutyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDutyModelToJson(GetDutyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
