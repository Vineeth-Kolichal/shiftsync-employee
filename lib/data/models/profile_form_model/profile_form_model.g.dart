// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileFormModel _$ProfileFormModelFromJson(Map<String, dynamic> json) =>
    ProfileFormModel(
      gender: json['gender'] as String,
      maritalstatus: json['maritalstatus'] as String,
      dateofbirth: json['dateofbirth'] as String,
      paddress: json['paddress'] as String,
      caddress: json['caddress'] as String,
      accno: json['accno'] as String,
      ifsccode: json['ifsccode'] as String,
      nameinpass: json['nameinpass'] as String,
      pannumber: json['pannumber'] as String,
      adhaarno: json['adhaarno'] as String,
      designation: json['designation'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$ProfileFormModelToJson(ProfileFormModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'maritalstatus': instance.maritalstatus,
      'dateofbirth': instance.dateofbirth,
      'paddress': instance.paddress,
      'caddress': instance.caddress,
      'accno': instance.accno,
      'ifsccode': instance.ifsccode,
      'nameinpass': instance.nameinpass,
      'pannumber': instance.pannumber,
      'adhaarno': instance.adhaarno,
      'designation': instance.designation,
      'photo': instance.photo,
    };
