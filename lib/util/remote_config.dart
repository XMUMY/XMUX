import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:taskflow/taskflow.dart';

import '../global.dart';
import 'platform.dart';

part 'remote_config.g.dart';

final initRemoteConfigsTask = Task((ctx) async {
  final defaultStatic = await rootBundle.loadString('res/static.json');
  remoteConfigs.updateStaticResources(defaultStatic);
});

final fetchRemoteConfigsTask = Task.when(
  () async => isMobile || isMacOS,
  (ctx) async {
    try {
      if (await RemoteConfig.instance.fetchAndActivate()) {
        final fetchedStatic =
            RemoteConfig.instance.getString('static_resources');
        remoteConfigs.updateStaticResources(fetchedStatic);
      }
    } on Exception catch (_) {}
  },
);

class RemoteConfigs {
  late StaticResources staticResources;

  void updateStaticResources(String json) =>
      staticResources = StaticResources.fromJson(jsonDecode(json));
}

@JsonSerializable(createToJson: false)
class StaticResources {
  final String defaultAvatar;
  final AcademicCalendarImages academicCalendarImages;
  final String busScheduleImage;
  final String kliaTransitScheduleImage;
  final String kliaExpressScheduleImage;

  StaticResources({
    required this.defaultAvatar,
    required this.academicCalendarImages,
    required this.busScheduleImage,
    required this.kliaTransitScheduleImage,
    required this.kliaExpressScheduleImage,
  });

  factory StaticResources.fromJson(Map<String, dynamic> json) =>
      _$StaticResourcesFromJson(json);
}

@JsonSerializable(createToJson: false)
class AcademicCalendarImages {
  final Map<String, String> undergraduate;
  final Map<String, String> foundation;

  const AcademicCalendarImages({
    this.undergraduate = const {},
    this.foundation = const {},
  });

  factory AcademicCalendarImages.fromJson(Map<String, dynamic> json) =>
      _$AcademicCalendarImagesFromJson(json);
}
