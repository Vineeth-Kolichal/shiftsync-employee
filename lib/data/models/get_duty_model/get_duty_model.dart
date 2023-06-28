import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_duty_model.g.dart';

@JsonSerializable()
class GetDutyModel {
  int? status;
  String? message;
  List<Datum>? data;

  GetDutyModel({this.status, this.message, this.data});

  factory GetDutyModel.fromJson(Map<String, dynamic> json) {
    return _$GetDutyModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDutyModelToJson(this);
}
