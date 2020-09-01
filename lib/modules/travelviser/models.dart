import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(createToJson: false)
class TravelviserUser {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'id_organization')
  final int organizationId;

  TravelviserUser(this.id, this.username, this.email, this.organizationId);

  factory TravelviserUser.fromJson(Map<String, dynamic> json) =>
      _$TravelviserUserFromJson(json);
}

@JsonSerializable(createToJson: false)
class BookingRecord {
  /// Pattern for parsing date time.
  static final _dateTimeFormat = DateFormat('dd MMMM yyyy hh.mm a');
  static final _dateFormat = DateFormat('dd MMMM yyyy');
  static final _boardDateFormat = DateFormat(' dd MMMM yyyy');

  final String key;
  @JsonKey(name: 'id_route')
  final int routeId;
  @JsonKey(name: 'id_trip')
  final int tripId;
  @JsonKey(name: 'dt_ticket')
  final String date;

  /// Name of trip. It is usually the departure time.
  final String trip;

  /// Name of route;
  final String route;
  @JsonKey(name: 'embark')
  final String from;
  @JsonKey(name: 'disembark')
  final String to;
  @JsonKey(name: 'dt_board')
  final String boardingDate;

  BookingRecord(this.key, this.routeId, this.tripId, this.date, this.trip,
      this.route, this.from, this.to, this.boardingDate);

  /// Parsed date time. Get current time if parsing failed.
  DateTime get dateTime {
    try {
      // Try to parse if trip is departure time.
      return _dateTimeFormat.parse('$date $trip');
    } on FormatException catch (_) {
      try {
        return _dateFormat.parse(date);
      } on FormatException catch (_) {
        return DateTime.now();
      }
    }
  }

  /// Parsed boarding date. Get `null` if not board yet.
  DateTime get boardingDateTime {
    try {
      return _boardDateFormat.parse(this.boardingDate.split(':').last);
    } catch (_) {
      return null;
    }
  }

  factory BookingRecord.fromJson(Map<String, dynamic> json) =>
      _$BookingRecordFromJson(json);
}

@JsonSerializable(createToJson: false)
class Route {
  final int id;
  final String name;
  @JsonKey(name: 'journey_days', fromJson: dayOfWeekFromJson)
  final int dayOfWeek;

  Route(this.id, this.name, this.dayOfWeek);

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  static int dayOfWeekFromJson(String json) =>
      int.parse(json.replaceAll('0', '7'));
}

@JsonSerializable(createToJson: false)
class Trip {
  final int id;
  final String title;

  Trip(this.id, this.title);

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}

@JsonSerializable(createToJson: false)
class WayPoint {
  final int id;
  final String name;

  WayPoint(this.id, this.name);

  factory WayPoint.fromJson(Map<String, dynamic> json) =>
      _$WayPointFromJson(json);
}
