import 'package:json_annotation/json_annotation.dart';

part 'profile_form_model.g.dart';

@JsonSerializable()
class ProfileFormModel {
  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'maritalstatus')
  final String maritalstatus;

  @JsonKey(name: 'dateofbirth')
  final String dateofbirth;

  @JsonKey(name: 'paddress')
  final String paddress;

  @JsonKey(name: 'caddress')
  final String caddress;

  @JsonKey(name: 'accno')
  final String accno;

  @JsonKey(name: 'ifsccode')
  final String ifsccode;

  @JsonKey(name: 'nameinpass')
  final String nameinpass;

  @JsonKey(name: 'pannumber')
  final String pannumber;

  @JsonKey(name: 'adhaarno')
  final String adhaarno;

  @JsonKey(name: 'designation')
  final String designation;

  @JsonKey(name: 'photo')
  final String photo;

  ProfileFormModel({
    required this.gender,
    required this.maritalstatus,
    required this.dateofbirth,
    required this.paddress,
    required this.caddress,
    required this.accno,
    required this.ifsccode,
    required this.nameinpass,
    required this.pannumber,
    required this.adhaarno,
    required this.designation,
    required this.photo,
  });

  factory ProfileFormModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileFormModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileFormModelToJson(this);
}
