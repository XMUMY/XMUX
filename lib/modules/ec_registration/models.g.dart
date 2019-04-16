// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectiveCourse _$ElectiveCourseFromJson(Map<String, dynamic> json) {
  return ElectiveCourse(
      json['Classification'] as String,
      json['Credits(max)'] == null
          ? null
          : int.parse(json['Credits(max)'] as String),
      json['Round'] as String,
      json['Deadline'] == null
          ? null
          : ElectiveCourse._periodFromJson(json['Deadline'] as String),
      json['Entry'] as String);
}

abstract class _$ElectiveCourseSerializerMixin {
  String get classification;
  int get maxCredit;
  String get round;
  PeriodOfDate get period;
  String get entry;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Classification': classification,
        'Credits(max)': maxCredit,
        'Round': round,
        'Deadline': period,
        'Entry': entry
      };
}
