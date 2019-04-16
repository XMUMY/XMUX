import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/common/period_of_date.dart';

part 'models.g.dart';

@JsonSerializable(generateToJsonFunction: false)
class ElectiveCourse {
  @JsonKey(name: 'Classification')
  final String classification;
  @JsonKey(name: 'Credits(max)', fromJson: int.parse)
  final int maxCredit;
  @JsonKey(name: 'Round')
  final String round;
  @JsonKey(name: 'Deadline', fromJson: _periodFromJson)
  final PeriodOfDate period;
  @JsonKey(name: 'Entry')
  final String entry;

  ElectiveCourse(
      this.classification, this.maxCredit, this.round, this.period, this.entry);

  static ElectiveCourse fromJson(Map<String, dynamic> json) =>
      _$ElectiveCourseFromJson(json);

  static PeriodOfDate _periodFromJson(String deadline) => PeriodOfDate(
      start: DateTime.parse(deadline.substring(0, 16)),
      end: DateTime.parse(deadline.substring(16)));
}
