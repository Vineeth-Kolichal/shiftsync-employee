import 'package:json_annotation/json_annotation.dart';

part 'sign_in_authentication.g.dart';

@JsonSerializable()
class SignInAuthentication {
  @JsonKey(name: 'username')
  String? username;

  @JsonKey(name: 'password')
  String? password;

  SignInAuthentication({required this.username, required this.password});

  factory SignInAuthentication.fromJson(Map<String, dynamic> json) {
    return _$SignInAuthenticationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignInAuthenticationToJson(this);
}
