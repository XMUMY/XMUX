import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/api/common.dart';

part 'notification.g.dart';

@JsonSerializable(createToJson: false)
class Notification {
  final int id;

  @JsonKey(name: 'useridfrom')
  final int from;
  @JsonKey(name: 'useridto')
  final int to;

  final String subject;

  @JsonKey(name: 'smallmessage')
  final String smallMessage;

  @JsonKey(name: 'fullmessage')
  final String fullMessage;

  @JsonKey(name: 'fullmessagehtml')
  final String fullMessageHtml;

  @JsonKey(name: 'timecreated', fromJson: timestampFromJson)
  final DateTime timeCreated;

  Notification(this.id, this.from, this.to, this.subject, this.smallMessage,
      this.fullMessage, this.fullMessageHtml, this.timeCreated);

  static Notification fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
