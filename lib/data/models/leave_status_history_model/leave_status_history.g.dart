// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_status_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveStatusHistory _$LeaveStatusHistoryFromJson(Map<String, dynamic> json) =>
    LeaveStatusHistory(
      leavetype: json['leavetype'] as String?,
      fromdate: json['fromdate'] as String?,
      todate: json['todate'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LeaveStatusHistoryToJson(LeaveStatusHistory instance) =>
    <String, dynamic>{
      'leavetype': instance.leavetype,
      'fromdate': instance.fromdate,
      'todate': instance.todate,
      'status': instance.status,
    };
