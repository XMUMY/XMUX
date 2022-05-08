/// Convert [DateTime] to unix timestamp.
int dateTimeToTimestamp(DateTime dateTime) =>
    dateTime.millisecondsSinceEpoch ~/ 1000;

/// Convert unix timestamp to [DateTime].
DateTime timestampToDateTime(int timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
