import 'package:json_annotation/json_annotation.dart';

part 'leave_request_resp_model.g.dart';

@JsonSerializable()
class LeaveRequestRespModel {
  int? status;
  String? message;


  LeaveRequestRespModel({this.status, this.message,});

  factory LeaveRequestRespModel.fromJson(Map<String, dynamic> json) {
    return _$LeaveRequestRespModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeaveRequestRespModelToJson(this);
}
