import 'package:json_annotation/json_annotation.dart';

part 'remote_config.g.dart';

class RemoteConfigs {
  StaticResources staticResources;
}

@JsonSerializable(createToJson: false)
class StaticResources {
  final String academicCalendarImage;
  final String busScheduleImage;
  final String kliaTransitScheduleImage;
  final String kliaExpressScheduleImage;

  StaticResources(this.academicCalendarImage, this.busScheduleImage,
      this.kliaTransitScheduleImage, this.kliaExpressScheduleImage);

  factory StaticResources.fromJson(Map<String, dynamic> json) =>
      _$StaticResourcesFromJson(json);
}
