/// Throws when user not found.
class UserNotFoundException implements Exception {
  String toString() => "Travelviser: User not found";
}

/// Throws when todayOfWeek > departure dayOfWeek in computing ticket date.
class WrongDateException implements Exception {
  String toString() => "Travelviser: Worng date selected.";
}

/// Throws when booking failed.
class InvalidBookingException implements Exception {
  final String message;

  InvalidBookingException(this.message);

  String toString() => message;
}
