import 'package:connectivity/connectivity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xmux/modules/xmux_api/models/models_v2.dart';

part 'state.g.dart';

/// Main state for app.
@JsonSerializable()
class MainAppState {
  /// AC state include timetable, exams, examResult and other academic data.
  final AcState acState;

  /// Auth state fro all authemation.
  final AuthState authState;

  /// Settings state include ePaymentPassword, etc.
  final SettingState settingState;

  /// Global UI state include drawerIsOpen, etc.
  @JsonKey(ignore: true)
  final UIState uiState;

  MainAppState(this.authState, this.settingState, this.acState,
      {UIState uiState})
      : this.uiState = uiState ?? UIState();

  /// Init MainAppState as default.
  MainAppState.def()
      : this.uiState = new UIState(),
        this.authState = AuthState.def(),
        this.settingState = SettingState.def(),
        this.acState = AcState.def();

  factory MainAppState.fromJson(Map<String, dynamic> json) =>
      _$MainAppStateFromJson(json);

  Map<String, dynamic> toJson() => _$MainAppStateToJson(this);
}

/// AC state include timetable, exams and other academic data from AC.
@JsonSerializable()
class AcState {
  /// The status of state.
  /// Including *init*, *success*
  final String status;

  /// The timestamp from server.
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
      AcState(
        status ?? this.status,
        timestamp ?? this.timestamp,
        timetable ?? this.timetable,
        exams ?? this.exams,
        examResult ?? this.examResult,
      );
}

/// Personal info state include uid, password, etc.
@JsonSerializable()
class AuthState {
  /// User authentication (Campus ID).
  final String campusID, campusIDPassword;

  /// E-payment password.
  final String ePaymentPassword;

  /// Moodle key.
  final String moodleKey;

  AuthState(this.campusID, this.campusIDPassword, this.ePaymentPassword,
      this.moodleKey);

  AuthState.def()
      : this.campusID = null,
        this.campusIDPassword = null,
        this.ePaymentPassword = null,
        this.moodleKey = null;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthStateToJson(this);

  AuthState copyWith(
          {String campusID,
          String campusIDPassword,
          String ePaymentPassword,
          String moodleKey}) =>
      new AuthState(
          campusID ?? this.campusID,
          campusIDPassword ?? this.campusIDPassword,
          ePaymentPassword ?? this.ePaymentPassword,
          moodleKey ?? this.moodleKey);
}

/// Settings state include ePaymentPassword, etc.
@JsonSerializable()
class SettingState {
  /// Enable functions under developing.
  final bool enableFunctionsUnderDev;

  SettingState(this.enableFunctionsUnderDev);

  SettingState.def() : this.enableFunctionsUnderDev = null;

  factory SettingState.fromJson(Map<String, dynamic> json) =>
      _$SettingStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingStateToJson(this);

  SettingState copyWith({
    bool enableFunctionsUnderDev,
  }) =>
      SettingState(enableFunctionsUnderDev ?? this.enableFunctionsUnderDev);
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
