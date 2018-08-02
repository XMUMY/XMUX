import 'package:connectivity/connectivity.dart';

/// Main App State include UI/PersonalInfo/Settings/AC.
class MainAppState {
  /// Global UI state include drawerIsOpen, etc.
  final UIState uiState;

  /// Personal info state include uid, password, etc.
  final PersonalInfoState personalInfoState;

  /// Settings state include ePaymentPassword, etc.
  final SettingState settingState;

  /// AC state include timetable, exams, examResult and other academic data.
  final ACState acState;

  /// Init MainAppState as default.
  MainAppState()
      : this.uiState = new UIState(),
        this.personalInfoState = new PersonalInfoState(),
        this.settingState = new SettingState(),
        this.acState = new ACState();

  /// Init MainAppState from raw.
  MainAppState.raw(
      this.uiState, this.personalInfoState, this.settingState, this.acState);

  /// Init MainAppStore from initMap.
  MainAppState.fromMap(Map<String, dynamic> map)
      : this.uiState = new UIState(), // Runtime state.
        this.personalInfoState =
            new PersonalInfoState.fromMap(map["personalInfoState"]),
        this.settingState = new SettingState.fromMap(map["settingState"]),
        this.acState = new ACState.fromMap(map["acState"]);

  /// Export MainAppState to initMap.
  Map<String, Map> toMap() => {
        "personalInfoState": this.personalInfoState.toMap(),
        "settingState": this.settingState.toMap(),
        "acState": this.acState.toMap(),
      };
}

/// Global UI state include drawerIsOpen, etc.
class UIState {
  /// Drawer is open.
  final bool drawerIsOpen;

  /// Connectivity result.
  final ConnectivityResult connectivity;

  /// Homepage sliders.
  final List news;

  /// Homepage announcements.
  final List announcements;

  UIState()
      : this.drawerIsOpen = false,
        this.connectivity = ConnectivityResult.none,
        this.news = [
          {
            "imageURL": "",
            "isWebPage": true,
            "uri": "",
          },
        ],
        this.announcements = [];

  UIState.raw(
      this.drawerIsOpen, this.connectivity, this.news, this.announcements);

  UIState copyWith(
          {bool drawerIsOpen,
          ConnectivityResult connectivity,
          List news,
          List announcements}) =>
      new UIState.raw(
          drawerIsOpen ?? this.drawerIsOpen,
          connectivity ?? this.connectivity,
          news ?? this.news,
          announcements ?? this.announcements);
}

/// Personal info state include uid, password, etc.
class PersonalInfoState {
  /// User authentication (Campus ID).
  final String uid, password;

  /// Moodle key.
  final String moodleKey;

  PersonalInfoState()
      : this.uid = null,
        this.password = null,
        this.moodleKey = null;

  PersonalInfoState.raw(this.uid, this.password, this.moodleKey);

  PersonalInfoState.fromMap(Map<String, dynamic> map)
      : this.uid = map["uid"],
        this.password = map["password"],
        this.moodleKey = map["moodleKey"];

  Map<String, String> toMap() => {
        "uid": this.uid,
        "password": this.password,
        "moodleKey": this.moodleKey,
      };

  PersonalInfoState copyWith({String uid, String password, String moodleKey}) =>
      new PersonalInfoState.raw(uid ?? this.uid, password ?? this.password,
          moodleKey ?? this.moodleKey);
}

/// Settings state include ePaymentPassword, etc.
class SettingState {
  /// E-payment password.
  final String ePaymentPassword;

  /// Enable functions under developing.
  final bool enableFunctionsUnderDev;

  SettingState()
      : ePaymentPassword = null,
        enableFunctionsUnderDev = false;

  SettingState.raw(this.ePaymentPassword, this.enableFunctionsUnderDev);

  SettingState.fromMap(Map<String, dynamic> map)
      : this.ePaymentPassword = map["ePaymentPassword"],
        this.enableFunctionsUnderDev = map["enableFunctionsUnderDev"];

  Map<String, dynamic> toMap() => {
        "ePaymentPassword": this.ePaymentPassword,
        "enableFunctionsUnderDev": this.enableFunctionsUnderDev,
      };

  SettingState copyWith({
    String ePaymentPassword,
    bool enableFunctionsUnderDev,
  }) =>
      new SettingState.raw(ePaymentPassword ?? this.ePaymentPassword,
          enableFunctionsUnderDev ?? this.enableFunctionsUnderDev);
}

/// AC state include timetable, exams, examResult and other academic data.
class ACState {
  /// AC status (success/error/init).
  final String status;

  /// Error message (available when error).
  String error;

  /// Last update timestamp.
  final int timestamp;

  /// Timetable list.
  final List timetable;

  /// Exams map.
  final List exams;

  /// Exam result map.
  final List examResult;

  /// Assignment List.
  final List assignments;

  ACState()
      : this.status = "init",
        this.timestamp = null,
        this.timetable = null,
        this.exams = null,
        this.examResult = null,
        this.assignments = null;

  ACState.raw(this.status, this.error, this.timestamp, this.timetable,
      this.exams, this.examResult, this.assignments);

  ACState.fromMap(Map<String, dynamic> acJson)
      : this.status = acJson["status"],
        this.timestamp = acJson["timestamp"],
        this.timetable = acJson["data"]["timetable"],
        this.exams = acJson["data"]["exams"],
        this.examResult = acJson["data"]["examResult"],
        this.assignments = acJson["data"]["assignments"] ?? null,
        this.error = acJson["error"] ?? null;

  Map<String, dynamic> toMap() => {
        "status": this.status,
        "timestamp": this.timestamp,
        "data": {
          "timetable": this.timetable,
          "exams": this.exams,
          "examResult": this.examResult,
          "assignments": this.assignments,
        },
        "error": this.error ?? null,
      };

  ACState copyWith(
          {String status,
          String error,
          int timestamp,
          List timetable,
          List exams,
          List examResult,
          List assignments}) =>
      new ACState.raw(
          status ?? this.status,
          error ?? this.error,
          timestamp ?? this.timestamp,
          timetable ?? this.timetable,
          exams ?? this.exams,
          examResult ?? this.examResult,
          assignments ?? this.assignments);
}
