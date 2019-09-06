import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'remote_config.g.dart';

class RemoteConfigs {
  StaticResources staticResources = StaticResources();
  Versions versions = Versions();

  void updateStaticResources(String json) =>
      staticResources = StaticResources.fromJson(jsonDecode(json));

  void updateVersions(String json) =>
      versions = Versions.fromJson(jsonDecode(json));
}

@JsonSerializable(createToJson: false)
class StaticResources {
  final AcademicCalendarImages academicCalendarImages;
  final String busScheduleImage;
  final String kliaTransitScheduleImage;
  final String kliaExpressScheduleImage;

  StaticResources(
      {this.academicCalendarImages,
      this.busScheduleImage,
      this.kliaTransitScheduleImage,
      this.kliaExpressScheduleImage});

  factory StaticResources.fromJson(Map<String, dynamic> json) =>
      _$StaticResourcesFromJson(json);
}

@JsonSerializable(createToJson: false)
class AcademicCalendarImages {
  final Map<String, String> undergraduate;
  final Map<String, String> foundation;

  AcademicCalendarImages({this.undergraduate, this.foundation});

  factory AcademicCalendarImages.fromJson(Map<String, dynamic> json) =>
      _$AcademicCalendarImagesFromJson(json);
}

@JsonSerializable(createToJson: false)
class Versions {
  final int latestBuildReleased;
  final String latestVersionReleased;
  final int minBuildSupported;
  final String minVersionSupported;

  Versions(
      {this.latestBuildReleased,
      this.latestVersionReleased,
      this.minBuildSupported = 0,
      this.minVersionSupported});

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);
}
