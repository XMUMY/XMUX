import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_config.g.dart';

class RemoteConfigs {
  static final instance = RemoteConfigs._();

  late StaticResources staticResources;

  RemoteConfigs._();

  Future<void> loadDefaultStaticResources() async {
    final defaultStatic = await rootBundle.loadString('res/static.json');
    staticResources = StaticResources.fromJson(jsonDecode(defaultStatic));
  }

  Future<void> loadFirebaseStaticResources() async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    final fetched = FirebaseRemoteConfig.instance.getString('static_resources');
    if (fetched.isNotEmpty) {
      staticResources = StaticResources.fromJson(jsonDecode(fetched));
    }
  }
}

@JsonSerializable(createToJson: false)
class StaticResources {
  final AcademicCalendarImages academicCalendarImages;
  final String busScheduleImage;
  final String kliaTransitScheduleImage;
  final String kliaExpressScheduleImage;

  StaticResources({
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
