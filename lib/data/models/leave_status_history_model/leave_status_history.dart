import 'package:json_annotation/json_annotation.dart';

part 'leave_status_history.g.dart';

@JsonSerializable()
class LeaveStatusHistory {
  @JsonKey(name: 'leavetype')
  String? leavetype;
  @JsonKey(name: 'fromdate')
  String? fromdate;
  @JsonKey(name: 'todate')
  String? todate;
  @JsonKey(name: 'status')
  String? status;

  LeaveStatusHistory({
    this.leavetype,
    this.fromdate,
    this.todate,
    this.status,
  });

  factory LeaveStatusHistory.fromJson(Map<String, dynamic> json) {
    return _$LeaveStatusHistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeaveStatusHistoryToJson(this);
}
