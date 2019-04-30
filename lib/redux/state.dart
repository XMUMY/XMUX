import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:xmux/modules/emgs/emgs.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

part 'state.g.dart';

/// Main state for app.
@immutable
@JsonSerializable()
class MainAppState {
  /// AC state include timetable, exams, examResult and other academic data.
  @JsonKey(nullable: false)
  final AcState acState;

  /// Auth state for all authentication.
  @JsonKey(nullable: false)
  final AuthState authState;

  /// Query state stores all query information.
  @JsonKey(nullable: false)
  final QueryState queryState;

  /// Settings state include ePaymentPassword, etc.
  @JsonKey(nullable: false)
  final SettingState settingState;

  /// Global UI state include drawerIsOpen, etc.
  @JsonKey(ignore: true)
  final UIState uiState;

  MainAppState(this.acState, this.authState, this.queryState, this.settingState,
      {UIState uiState})
      : this.uiState = uiState ?? UIState.def();

  /// Init MainAppState as default.
  MainAppState.def()
      : this.acState = AcState.def(),
        this.authState = AuthState.def(),
        this.queryState = QueryState.def(),
        this.settingState = SettingState.def(),
        this.uiState = UIState.def();

  factory MainAppState.fromJson(Map<String, dynamic> json) =>
      _$MainAppStateFromJson(json);

  Map<String, dynamic> toJson() => _$MainAppStateToJson(this);
}

/// AC state include timetable, exams and other academic data.
@JsonSerializable()
class AcState {
  /// The status of state.
  /// Including *init*, *success*
  final String status;

  /// The timestamp from server.
  final DateTime timestamp;

  final Info info;
  final List<Lesson> timetable;
  final List<Exam> exams;
  final List<SessionExamResult> examResult;
  final List<Course> courses;
  final List<LessonAssignments> assignments;

  AcState(this.status, this.timestamp, this.info, this.timetable, this.exams,
      this.examResult, this.courses, this.assignments);

  AcState.def()
      : this.status = 'init',
        this.timestamp = null,
        this.info = null,
        this.timetable = null,
        this.exams = null,
        this.examResult = null,
        this.courses = null,
        this.assignments = null;

  factory AcState.fromJson(Map<String, dynamic> json) =>
      _$AcStateFromJson(json);

  Map<String, dynamic> toJson() => _$AcStateToJson(this);

  AcState copyWith(
          {String status,
          DateTime timestamp,
          Info info,
          List<Lesson> timetable,
          List<Exam> exams,
          List<SessionExamResult> examResult,
          List<Course> courses,
          List<LessonAssignments> assignments}) =>
      AcState(
          status ?? this.status,
          timestamp ?? this.timestamp,
          info ?? this.info,
          timetable ?? this.timetable,
          exams ?? this.exams,
          examResult ?? this.examResult,
          courses ?? this.courses,
          assignments ?? this.assignments);
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
      AuthState(
          campusID ?? this.campusID,
          campusIDPassword ?? this.campusIDPassword,
          ePaymentPassword ?? this.ePaymentPassword,
          moodleKey ?? this.moodleKey);
}

@JsonSerializable()
class QueryState {
  /// Billing records from E-Payment.
  final List<BillingRecord> ePaymentRecords;

  /// Application status for VISA.
  final EmgsApplicationResult emgsApplicationResult;

  QueryState(this.ePaymentRecords, this.emgsApplicationResult);

  QueryState.def()
      : this.ePaymentRecords = null,
        this.emgsApplicationResult = null;

  factory QueryState.fromJson(Map<String, dynamic> json) =>
      _$QueryStateFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStateToJson(this);

  QueryState copyWith(
          {List<BillingRecord> ePaymentRecords,
          EmgsApplicationResult emgsApplicationResult}) =>
      QueryState(ePaymentRecords ?? this.ePaymentRecords,
          emgsApplicationResult ?? this.emgsApplicationResult);
}

/// Settings state include ePaymentPassword, etc.
@JsonSerializable()
class SettingState {
  /// Enable functions under developing.
  @JsonKey(defaultValue: false)
  final bool enableFunctionsUnderDev;

  SettingState(this.enableFunctionsUnderDev);

  SettingState.def() : this.enableFunctionsUnderDev = false;

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

  /// Dark mode.
  final bool darkMode;

  /// Homepage sliders.
  final List<News> homepageNews;

  /// Homepage announcements.
  final List<Announcement> announcements;

  UIState(
      this.drawerIsOpen, this.darkMode, this.homepageNews, this.announcements);

  UIState.def()
      : this.drawerIsOpen = false,
        this.darkMode = false,
        this.homepageNews = null,
        this.announcements = null;

  UIState copyWith(
          {bool drawerIsOpen,
          bool darkMode,
          List<News> homepageNews,
          List announcements}) =>
      UIState(
          drawerIsOpen ?? this.drawerIsOpen,
          darkMode ?? this.darkMode,
          homepageNews ?? this.homepageNews,
          announcements ?? this.announcements);
}
