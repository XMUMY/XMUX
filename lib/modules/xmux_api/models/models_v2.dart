import 'package:flutter/material.dart' show TimeOfDay;
import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/common/duration_of_day.dart';

part 'ac_v2.dart';
part 'models_v2.g.dart';
part 'moodle_v2.dart';

@JsonSerializable()
class Announcement {
  final String headline;
  final String detail;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime timestamp;
  final String uri;

  Announcement(this.headline, this.detail, this.timestamp, this.uri);

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);

  static DateTime _timestampFromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp);

  static int _timestampToJson(DateTime timestamp) =>
      timestamp.millisecondsSinceEpoch;
}

@JsonSerializable()
class BillingRecord {
  final String item;
  @JsonKey(fromJson: _amountFromJson, toJson: _amountToJson)
  final double amount;
  final String balance;

  BillingRecord(this.item, this.amount, this.balance);

  factory BillingRecord.fromJson(Map<String, dynamic> json) =>
      _$BillingRecordFromJson(json);

  bool get isPaid => balance == '-';

  Map<String, dynamic> toJson() => _$BillingRecordToJson(this);

  static double _amountFromJson(String amount) =>
      double.parse(amount.replaceAll(',', ''));

  static String _amountToJson(double amount) => amount.toStringAsFixed(2);
}

@JsonSerializable()
class News {
  final String name;

  /// Background image URL.
  final String imageURL;

  /// URI to launch. Launch will be disabled if `null`.
  final String uri;

  News(this.name, this.imageURL, this.uri);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class User {
  final String campusId;
  final String name;

  /// The user avatar, usually from moodle (need convert).
  @JsonKey(name: 'headpic')
  final String photoUrl;

  User(this.campusId, this.name, this.photoUrl);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
