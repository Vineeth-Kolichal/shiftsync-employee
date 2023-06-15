import 'package:json_annotation/json_annotation.dart';

part 'sign_in_authentication_response.g.dart';

@JsonSerializable()
class SignInAuthenticationResponseModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'erros')
  List<dynamic>? errors;

  @JsonKey(name: 'data')
  List<dynamic>? data;

  SignInAuthenticationResponseModel({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory SignInAuthenticationResponseModel.fromJson(
      Map<String, dynamic> json) {
    return _$SignInAuthenticationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$SignInAuthenticationResponseModelToJson(this);
}
