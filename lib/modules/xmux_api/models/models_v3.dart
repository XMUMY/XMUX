import 'package:json_annotation/json_annotation.dart';

part 'models_v3.g.dart';

@JsonSerializable(createToJson: false)
class LoginResp {
  final String customToken;

  LoginResp(this.customToken);

  static LoginResp fromJson(Map<String, dynamic> json) =>
      _$LoginRespFromJson(json);
}

@JsonSerializable()
class GetTimetableResp {
  final List<TimetableClass> timetable;

  @JsonKey(name: 'recentUpdateS')
  final DateTime recentUpdate;

  GetTimetableResp(this.timetable, this.recentUpdate);

  static GetTimetableResp fromJson(Map<String, dynamic> json) =>
      _$GetTimetableRespFromJson(json);

  Map<String, dynamic> toJson() => _$GetTimetableRespToJson(this);
}

@JsonSerializable()
class TimetableClass {
  final String cid;
  final String name;
  final String lecturer;
  final String room;
  final int day;
  final String startDay;
  final String endDay;

  TimetableClass(this.cid, this.name, this.lecturer, this.room, this.day,
      this.startDay, this.endDay);

  static TimetableClass fromJson(Map<String, dynamic> json) =>
      _$TimetableClassFromJson(json);

  Map<String, dynamic> toJson() => _$TimetableClassToJson(this);
}
