// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInAuthenticationModel _$SignInAuthenticationModelFromJson(
        Map<String, dynamic> json) =>
    SignInAuthenticationModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInAuthenticationModelToJson(
        SignInAuthenticationModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
