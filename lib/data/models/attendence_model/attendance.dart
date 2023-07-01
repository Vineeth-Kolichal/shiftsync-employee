import 'package:json_annotation/json_annotation.dart';

part 'attendance.g.dart';

@JsonSerializable()
class Attendance {
  String? date;
  String? timein;
  String? timeout;
  String? dutytype;
  int? totalhour;
  int? overtime;

  Attendance({
    this.date,
    this.timein,
    this.timeout,
    this.dutytype,
    this.totalhour,
    this.overtime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return _$AttendanceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);
}
