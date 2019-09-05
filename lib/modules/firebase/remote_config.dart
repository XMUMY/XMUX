import 'package:json_annotation/json_annotation.dart';

part 'remote_config.g.dart';

class RemoteConfigs {
  StaticResources staticResources = StaticResources();
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
