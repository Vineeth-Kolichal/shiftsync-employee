import 'package:json_annotation/json_annotation.dart';

part 'sign_in_authentication_response.g.dart';

@JsonSerializable()
class SignInAuthenticationResponse {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'erros')
  List<String>? errors;

  @JsonKey(name: 'data')
  String? data;

  SignInAuthenticationResponse({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory SignInAuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return _$SignInAuthenticationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignInAuthenticationResponseToJson(this);
}
