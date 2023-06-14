// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpOtpResponseModel _$SignUpOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    SignUpOtpResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignUpOtpResponseModelToJson(
        SignUpOtpResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
