// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_status_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveStatusHistoryModel _$LeaveStatusHistoryModelFromJson(
        Map<String, dynamic> json) =>
    LeaveStatusHistoryModel(
      leaveStatusHistory: (json['Leave Status/History'] as List<dynamic>?)
          ?.map((e) => LeaveStatusHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$LeaveStatusHistoryModelToJson(
        LeaveStatusHistoryModel instance) =>
    <String, dynamic>{
      'Leave Status/History': instance.leaveStatusHistory,
      'status': instance.status,
    };
