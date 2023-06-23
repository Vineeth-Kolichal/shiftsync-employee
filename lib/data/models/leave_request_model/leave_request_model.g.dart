// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveRequestModel _$LeaveRequestModelFromJson(Map<String, dynamic> json) =>
    LeaveRequestModel(
      leavetype: json['leavetype'] as String,
      fromdate: json['fromdate'] as String,
      todate: json['todate'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$LeaveRequestModelToJson(LeaveRequestModel instance) =>
    <String, dynamic>{
      'leavetype': instance.leavetype,
      'fromdate': instance.fromdate,
      'todate': instance.todate,
      'reason': instance.reason,
    };
