import 'package:connectivity/connectivity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/xmux_api/models/models_v2.dart';

part 'state.g.dart';

/// Main App State include UI/PersonalInfo/Settings/AC.
class MainAppState {
  /// Global UI state include drawerIsOpen, etc.
  final UIState uiState;

  /// Personal info state include uid, password, etc.
  final PersonalInfoState personalInfoState;

  /// Settings state include ePaymentPassword, etc.
  final SettingState settingState;

  /// AC state include timetable, exams, examResult and other academic data.
  final ACState oacState;

  final AcState acState;

  MainAppState(this.uiState, this.personalInfoState, this.settingState,
      this.oacState, this.acState);

  /// Init MainAppState as default.
  MainAppState.def()
      : this.uiState = new UIState(),
        this.personalInfoState = new PersonalInfoState(),
        this.settingState = new SettingState(),
        this.oacState = new ACState(),
        this.acState = AcState.def();

  /// Init MainAppStore from initMap.
  MainAppState.fromMap(Map<String, dynamic> map)
      : this.uiState = new UIState(),
        // Runtime state.
        this.personalInfoState =
            new PersonalInfoState.fromMap(map["personalInfoState"]),
        this.settingState = new SettingState.fromMap(map["settingState"]),
        this.oacState = new ACState.fromMap(map["acState"]),
        this.acState = AcState.fromJson(map);

  /// Export MainAppState to initMap.
  Map<String, Map> toMap() => {
        "personalInfoState": this.personalInfoState.toMap(),
        "settingState": this.settingState.toMap(),
        "acState": this.acState.toJson(),
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
@JsonSerializable()
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
@JsonSerializable()
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
        this.enableFunctionsUnderDev = map["enableFunctionsUnderDev"] ?? false;

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

@JsonSerializable()
class AcState {
  final String status;
  final DateTime timestamp;
  final List<Lesson> timetable;
  final List<Exam> exams;
  final List<SessionExamResult> examResult;

  AcState(
      this.status, this.timestamp, this.timetable, this.exams, this.examResult);

  AcState.def()
      : this.status = 'init',
        this.timestamp = null,
        this.timetable = null,
        this.exams = null,
        this.examResult = null;

  factory AcState.fromJson(Map<String, dynamic> json) =>
      _$AcStateFromJson(json);

  Map<String, dynamic> toJson() => _$AcStateToJson(this);

  AcState copyWith(
          {String status,
          DateTime timestamp,
          List<Lesson> timetable,
          List<Exam> exams,
          List<SessionExamResult> examResult,
          List assignments}) =>
      new AcState(
        status ?? this.status,
        timestamp ?? this.timestamp,
        timetable ?? this.timetable,
        exams ?? this.exams,
        examResult ?? this.examResult,
      );
}
