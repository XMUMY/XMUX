// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaticResources _$StaticResourcesFromJson(Map<String, dynamic> json) =>
    StaticResources(
      academicCalendarImages: AcademicCalendarImages.fromJson(
          json['academicCalendarImages'] as Map<String, dynamic>),
      busScheduleImage: json['busScheduleImage'] as String,
      kliaTransitScheduleImage: json['kliaTransitScheduleImage'] as String,
      kliaExpressScheduleImage: json['kliaExpressScheduleImage'] as String,
    );

AcademicCalendarImages _$AcademicCalendarImagesFromJson(
        Map<String, dynamic> json) =>
    AcademicCalendarImages(
      undergraduate: (json['undergraduate'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      foundation: (json['foundation'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );
