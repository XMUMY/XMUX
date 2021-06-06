// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaticResources _$StaticResourcesFromJson(Map<String, dynamic> json) {
  return StaticResources(
    defaultAvatar: json['defaultAvatar'] as String,
    academicCalendarImages: AcademicCalendarImages.fromJson(
        json['academicCalendarImages'] as Map<String, dynamic>),
    busScheduleImage: json['busScheduleImage'] as String,
    kliaTransitScheduleImage: json['kliaTransitScheduleImage'] as String,
    kliaExpressScheduleImage: json['kliaExpressScheduleImage'] as String,
  );
}

AcademicCalendarImages _$AcademicCalendarImagesFromJson(
    Map<String, dynamic> json) {
  return AcademicCalendarImages(
    undergraduate: Map<String, String>.from(json['undergraduate'] as Map),
    foundation: Map<String, String>.from(json['foundation'] as Map),
  );
}
