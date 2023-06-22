import 'package:json_annotation/json_annotation.dart';

part 'profile_form_response_model.g.dart';

@JsonSerializable()
class ProfileFormResponseModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'errors')
  List<String>? errors;

  ProfileFormResponseModel({
    this.status,
    this.message,
    this.errors,
  });

  factory ProfileFormResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileFormResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileFormResponseModelToJson(this);
}
