// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveRequestRespModel _$LeaveRequestRespModelFromJson(
        Map<String, dynamic> json) =>
    LeaveRequestRespModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LeaveRequestRespModelToJson(
        LeaveRequestRespModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
