import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'msg')
  String? msg;

  DashboardModel({
    required this.status,
    required this.message,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return _$DashboardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}
