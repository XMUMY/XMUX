// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaticResources _$StaticResourcesFromJson(Map<String, dynamic> json) {
  return StaticResources(
    defaultAvatar: json['defaultAvatar'] as String,
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

Versions _$VersionsFromJson(Map<String, dynamic> json) {
  return Versions(
    latestBuildReleased: json['latestBuildReleased'] as int ?? 0,
    latestVersionReleased: json['latestVersionReleased'] as String,
    minBuildSupported: json['minBuildSupported'] as int ?? 0,
    minVersionSupported: json['minVersionSupported'] as String,
  );
}
