// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInAuthentication _$SignInAuthenticationFromJson(
        Map<String, dynamic> json) =>
    SignInAuthentication(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignInAuthenticationToJson(
        SignInAuthentication instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
