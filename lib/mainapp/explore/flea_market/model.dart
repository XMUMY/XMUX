import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(createToJson: false)
class Item {
  final String from;
  final String name;
  final String description;
  final DateTime timestamp;
  final String mainPicture;
//  List<String> photos;

  Item(
      this.from, this.name, this.description, this.timestamp, this.mainPicture);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
