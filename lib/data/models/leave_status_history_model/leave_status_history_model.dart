import 'package:json_annotation/json_annotation.dart';

import 'leave_status_history.dart';

part 'leave_status_history_model.g.dart';

@JsonSerializable()
class LeaveStatusHistoryModel {
  @JsonKey(name: 'Leave Status/History')
  List<LeaveStatusHistory>? leaveStatusHistory;
  @JsonKey(name: 'status')
  int? status;

  LeaveStatusHistoryModel({this.leaveStatusHistory, this.status});

  factory LeaveStatusHistoryModel.fromJson(Map<String, dynamic> json) {
    return _$LeaveStatusHistoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeaveStatusHistoryModelToJson(this);
}
