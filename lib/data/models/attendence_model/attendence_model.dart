import 'package:json_annotation/json_annotation.dart';

import 'attendance.dart';

part 'attendence_model.g.dart';

@JsonSerializable()
class AttendenceModel {
  @JsonKey(name: 'Attendance')
  List<Attendance>? attendance;
  int? status;

  AttendenceModel({this.attendance, this.status});

  factory AttendenceModel.fromJson(Map<String, dynamic> json) {
    return _$AttendenceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendenceModelToJson(this);
}
