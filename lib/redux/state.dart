class MainAppState {
  final bool drawerIsOpen;

  /// Personal info state include uid, password, etc.
  final PersonalInfoState personalInfoState;

  /// Settings state include ePaymentPassword, etc.
  final SettingState settingState;

  /// Homepage state include sliders and announcements.
  final HomePageState homePageState;

  /// AC state include timetable, exams and examResult.
  final ACState acState;

  MainAppState()
      : this.drawerIsOpen = false,
        this.personalInfoState = new PersonalInfoState(),
        this.settingState = new SettingState(),
        this.homePageState = new HomePageState(),
        this.acState = new ACState();

  MainAppState.raw(this.drawerIsOpen, this.personalInfoState, this.settingState,
      this.homePageState, this.acState);

  MainAppState.fromJson(Map json)
      : this.drawerIsOpen = false,
        this.personalInfoState = new PersonalInfoState(),
        this.settingState = new SettingState(),
        this.homePageState = new HomePageState(),
        this.acState = new ACState.fromJson(json["acState"]);

  MainAppState copyWith(
          {bool drawerIsOpen,
          PersonalInfoState personalInfoState,
          SettingState settingState,
          HomePageState homePageState,
          ACState acState}) =>
      new MainAppState.raw(
          drawerIsOpen ?? this.drawerIsOpen,
          personalInfoState ?? this.personalInfoState,
          settingState ?? this.settingState,
          homePageState ?? this.homePageState,
          acState ?? this.acState);

  String toString() => "MainAppState";
}

class PersonalInfoState {
  /// User authentication (Campus ID).
  final String uid, password;

  /// AvatarURL.
  final String avatarURL;

  PersonalInfoState()
      : this.uid = null,
        this.password = null,
        this.avatarURL = null;

  PersonalInfoState.fromJson(Map piJson)
      : this.uid = piJson["uid"],
        this.password = piJson["password"],
        this.avatarURL = piJson["avaterURL"];
}

class SettingState {
  /// E-payment password.
  String ePaymentPassword;
}

class HomePageState {
  /// News for homepage slider.
  final List<Map<String, dynamic>> news;

  /// Announcements for homepage.
  final Map<String, dynamic> announcements;

  HomePageState()
      : this.news = const [],
        this.announcements = const {};
}

class ACState {
  /// AC status (success/error/init).
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

  ACState()
      : this.status = "init",
        this.timestamp = null,
        this.timetable = null,
        this.exams = null,
        this.examResult = null;

  ACState.fromJson(Map<String, dynamic> acJson)
      : this.status = acJson["status"],
        this.timestamp = acJson["timestamp"],
        this.timetable = acJson["data"]["timetable"],
        this.exams = acJson["data"]["exams"],
        this.examResult = acJson["data"]["examResult"],
        this.error = acJson["error"] ?? null;
}
