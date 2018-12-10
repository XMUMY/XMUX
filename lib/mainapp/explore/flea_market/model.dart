import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Item {
  /// The key for database. Only available if not new.
  @JsonKey(ignore: true)
  String key;

  final String from;
  final String name;
  final String description;
  @JsonKey(fromJson: _priceFromJson, toJson: _priceToJson)
  final Price price;
  final DateTime timestamp;
  final List<String> photos;

  Item(this.from, this.name, this.description, this.price, this.timestamp,
      this.photos);

  factory Item.fromSnapshot(DataSnapshot snap) {
    var item = Item.fromJson(Map<String, dynamic>.from(snap.value));
    item.key = snap.key;
    return item;
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  /// BUG: Firebase database cannot convert json serializable instance.
  static Price _priceFromJson(Map p) =>
      Price.fromJson(Map<String, dynamic>.from(p));
  static Map<String, dynamic> _priceToJson(Price p) => _$PriceToJson(p);
}

@JsonSerializable()
class Price {
  final double value;
  final String currencies;

  Price(this.value, this.currencies);

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

@JsonSerializable(createToJson: false)
class Comment {
  final String from;
  final String comment;

  Comment(this.from, this.comment);

  factory Comment.fromSnapshot(DataSnapshot snap) =>
      _$CommentFromJson(Map<String, dynamic>.from(snap.value));
}
