import 'package:json_annotation/json_annotation.dart';

import '../common.dart';

part 'v3_lost_and_found.g.dart';

enum LostAndFoundType {
  @JsonValue(0)
  lost,
  @JsonValue(1)
  found
}

@JsonSerializable(createToJson: false)
class LostAndFoundBrief {
  final String id;
  final String uid;
  final LostAndFoundType type;
  final String name;
  @JsonKey(fromJson: timestampFromJson)
  final DateTime timestamp;
  final String location;

  LostAndFoundBrief(
      this.id, this.uid, this.type, this.name, this.timestamp, this.location);

  static LostAndFoundBrief fromJson(Map<String, dynamic> json) =>
      _$LostAndFoundBriefFromJson(json);
}

@JsonSerializable(createToJson: false)
class LostAndFoundDetail extends LostAndFoundBrief {
  final String description;
  final Map<String, String> contacts;
  final List<String> pictures;
  final String comment;

  LostAndFoundDetail(
      String id,
      String uid,
      LostAndFoundType type,
      String name,
      DateTime timestamp,
      String location,
      this.description,
      this.contacts,
      this.pictures,
      this.comment)
      : super(id, uid, type, name, timestamp, location);

  static LostAndFoundDetail fromJson(Map<String, dynamic> json) =>
      _$LostAndFoundDetailFromJson(json);
}
