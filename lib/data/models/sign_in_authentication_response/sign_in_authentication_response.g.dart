// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_authentication_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInAuthenticationResponse _$SignInAuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    SignInAuthenticationResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      errors:
          (json['erros'] as List<dynamic>?)?.map((e) => e as String).toList(),
      data: json['data'] as String?,
    );

Map<String, dynamic> _$SignInAuthenticationResponseToJson(
        SignInAuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'erros': instance.errors,
      'data': instance.data,
    };
