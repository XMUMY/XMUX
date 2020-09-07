import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/common/timestamp_json.dart';

part 'upcoming_event.g.dart';

@JsonSerializable()
class UpcomingEvent {
  final int id;
  final String name;
  final String description;

  @JsonKey(
    name: 'timestart',
    fromJson: timestampToDateTime,
    toJson: dateTimeToTimestamp,
  )
  final DateTime timeStart;

  const UpcomingEvent(this.id, this.name, this.description, this.timeStart);

  static UpcomingEvent fromJson(Map<String, dynamic> json) =>
      _$UpcomingEventFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingEventToJson(this);
}
