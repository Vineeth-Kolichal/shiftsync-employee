import 'package:json_annotation/json_annotation.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogoutResponseModel {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;

  LogoutResponseModel({
    this.status,
    this.message,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LogoutResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoutResponseModelToJson(this);
}
