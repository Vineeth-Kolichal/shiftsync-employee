import 'package:json_annotation/json_annotation.dart';

part 'sign_up_otp_response_model.g.dart';

@JsonSerializable()
class SignUpOtpResponseModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  SignUpOtpResponseModel({
    this.status,
    this.message,
  });

  factory SignUpOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpOtpResponseModelToJson(this);
}
