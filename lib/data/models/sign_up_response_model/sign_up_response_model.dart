import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;


  SignUpResponseModel({required this.status,required this.message,});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
