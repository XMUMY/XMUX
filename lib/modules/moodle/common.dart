int timestampToJson(DateTime dateTime) =>
    dateTime.millisecondsSinceEpoch ~/ 1000;

DateTime timestampFromJson(int timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
