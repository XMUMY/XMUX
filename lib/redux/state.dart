class MainAppState {
  final bool drawerIsOpen;

  /// Personal info state include uid, password, etc.
  PersonalInfoState personalInfoState;

  /// Settings state include ePaymentPassword, etc.
  SettingState settingState;

  /// AC state include timetable, exams and examResult.
  ACState acState;

  MainAppState(this.drawerIsOpen);

  MainAppState.fromJson(Map json) : this.drawerIsOpen = false {
    this.personalInfoState = new PersonalInfoState();
    this.acState = new ACState.fromJson(json["acState"]);
  }
  String toString() => "MainAppState";
}

class PersonalInfoState {
  /// User authentication (Campus ID).
  String uid, password;

  /// AvatarURL.
  String avatarURL;
}

class SettingState {
  /// E-payment password.
  String ePaymentPassword;
}

class ACState {
  /// AC status (success/error).
  final String status;

  /// Error message (available when error).
  String error;

  /// Last update timestamp.
  final int timestamp;

  /// Timetable map.
  final Map<String, dynamic> timetable;

  /// Exams map.
  final Map<String, dynamic> exams;

  /// Exam result Map.
  final Map<String, dynamic> examResult;

  ACState(
      this.status, this.timestamp, this.timetable, this.exams, this.examResult,
      {this.error});

  ACState.fromJson(Map<String, dynamic> acJson)
      : this.status = acJson["status"],
        this.timestamp = acJson["timestamp"],
        this.timetable = acJson["data"]["timetable"],
        this.exams = acJson["data"]["exams"],
        this.examResult = acJson["data"]["examResult"],
        this.error = acJson["error"] ?? null;
}
