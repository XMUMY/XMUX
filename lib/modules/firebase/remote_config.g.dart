// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaticResources _$StaticResourcesFromJson(Map<String, dynamic> json) {
  return StaticResources(
    academicCalendarImages: json['academicCalendarImages'] == null
        ? null
        : AcademicCalendarImages.fromJson(
            json['academicCalendarImages'] as Map<String, dynamic>),
    busScheduleImage: json['busScheduleImage'] as String,
    kliaTransitScheduleImage: json['kliaTransitScheduleImage'] as String,
    kliaExpressScheduleImage: json['kliaExpressScheduleImage'] as String,
  );
}

AcademicCalendarImages _$AcademicCalendarImagesFromJson(
    Map<String, dynamic> json) {
  return AcademicCalendarImages(
    undergraduate: (json['undergraduate'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    foundation: (json['foundation'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}
