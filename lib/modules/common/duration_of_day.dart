library common.duration_of_day;

import 'package:flutter/material.dart' show TimeOfDay;

class DurationOfDay {
  final TimeOfDay start;
  final TimeOfDay end;

  DurationOfDay._(this.start, this.end);

  /// Parse string like "15:00-17:00".
  static parse(String duration) {
    List<String> _durationParts = duration.split("-");

    // Parse parts to int.
    List<int> _startParts =
        _durationParts[0].split(":").map((s) => int.parse(s)).toList();
    List<int> _endParts =
        _durationParts[1].split(":").map((s) => int.parse(s)).toList();

    TimeOfDay _start = TimeOfDay(hour: _startParts[0], minute: _startParts[1]);
    TimeOfDay _end = TimeOfDay(hour: _endParts[0], minute: _endParts[1]);
    return DurationOfDay._(_start, _end);
  }

  /// Convert to readable string.
  String toString() =>
      "${start.hour}:${start.minute}-${end.hour}:${end.minute}";

  /// Convert function for json serialize.
  static toJson(DurationOfDay duration) => duration.toString();

  /// Get Duration.
  get duration => Duration();
  //TODO: Get Duration.
}
