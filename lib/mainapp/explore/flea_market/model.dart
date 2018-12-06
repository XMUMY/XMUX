import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Item {
  String key;

  final String from;
  final String name;
  final String description;
  final DateTime timestamp;
  final List<String> photos;

  Item(this.from, this.name, this.description, this.timestamp, this.photos);

  factory Item.fromSnapshot(DataSnapshot snap) {
    var item = Item.fromJson(Map<String, dynamic>.from(snap.value));
    item.key = snap.key;
    return item;
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class Comment {
  final String from;
  final String comment;

  Comment(this.from, this.comment);

  factory Comment.fromSnapshot(DataSnapshot snap) =>
      _$CommentFromJson(Map<String, dynamic>.from(snap.value));
}
