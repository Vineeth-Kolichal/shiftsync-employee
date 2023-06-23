import 'package:json_annotation/json_annotation.dart';

part 'leave_request_model.g.dart';

@JsonSerializable()
class LeaveRequestModel {
  @JsonKey(name: 'leavetype')
  final String leavetype;

  @JsonKey(name: 'fromdate')
  final String fromdate;

  @JsonKey(name: 'todate')
  final String todate;

  @JsonKey(name: 'reason')
  final String reason;

  LeaveRequestModel({
    required this.leavetype,
    required this.fromdate,
    required this.todate,
    required this.reason,
  });

  factory LeaveRequestModel.fromJson(Map<String, dynamic> json) {
    return _$LeaveRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeaveRequestModelToJson(this);
}
