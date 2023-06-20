// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    )..msg = json['msg'] as String?;

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'msg': instance.msg,
    };
