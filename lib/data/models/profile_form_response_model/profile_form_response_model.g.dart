// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileFormResponseModel _$ProfileFormResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileFormResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProfileFormResponseModelToJson(
        ProfileFormResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
