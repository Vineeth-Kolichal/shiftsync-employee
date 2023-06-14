import 'package:json_annotation/json_annotation.dart';

part 'sign_in_authentication.g.dart';

@JsonSerializable()
class SignInAuthenticationModel {
  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  SignInAuthenticationModel({required this.username, required this.password});

  factory SignInAuthenticationModel.fromJson(Map<String, dynamic> json) {
    return _$SignInAuthenticationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignInAuthenticationModelToJson(this);
}
