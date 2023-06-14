import 'package:json_annotation/json_annotation.dart';

part 'sign_up.g.dart';

@JsonSerializable()
class SignUpModel {
  @JsonKey(name: 'firstname')
  final String firstname;

  @JsonKey(name: 'lastname')
  final String lastname;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'phone')
  final int phone;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  SignUpModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
