// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseModel _$LogoutResponseModelFromJson(Map<String, dynamic> json) =>
    LogoutResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LogoutResponseModelToJson(
        LogoutResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
