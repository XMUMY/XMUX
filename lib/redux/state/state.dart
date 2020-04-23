import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

import 'query.dart';

export 'query.dart';

part 'state.g.dart';
part 'user.dart';

/// Main state for app.
@immutable
@JsonSerializable()
class MainAppState {
  /// AC state include timetable, exams, examResult and other academic data.
  @JsonKey(nullable: false)
  final AcState acState;

  /// User state for all information of current user.
  @JsonKey(nullable: false)
  final User user;

  /// Query state stores all query information.
  @JsonKey(nullable: false)
  final QueryState queryState;

  /// Settings state include ePaymentPassword, etc.
  @JsonKey(nullable: false)
  final SettingState settingState;

  /// Global UI state include drawerIsOpen, etc.
  @JsonKey(ignore: true)
  final UIState uiState;

  MainAppState(this.acState, this.user, this.queryState, this.settingState,
      {UIState uiState})
      : this.uiState = uiState ?? UIState.def();

  /// Init MainAppState as default.
  MainAppState.def()
      : this.acState = AcState.def(),
        this.user = User.def(),
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

  AcState(this.status, this.timestamp, this.info, this.timetable, this.exams);

  AcState.def()
      : this.status = 'init',
        this.timestamp = null,
        this.info = null,
        this.timetable = null,
        this.exams = null;

  factory AcState.fromJson(Map<String, dynamic> json) =>
      _$AcStateFromJson(json);

  Map<String, dynamic> toJson() => _$AcStateToJson(this);

  AcState copyWith(
          {String status,
          DateTime timestamp,
          Info info,
          List<Lesson> timetable,
          List<Exam> exams}) =>
      AcState(status ?? this.status, timestamp ?? this.timestamp,
          info ?? this.info, timetable ?? this.timetable, exams ?? this.exams);
}

/// Settings state include ePaymentPassword, etc.
@JsonSerializable()
class SettingState {
  final ThemeMode themeMode;

  /// Enable functions under developing.
  @JsonKey(defaultValue: false)
  final bool enableFunctionsUnderDev;

  SettingState(this.themeMode, this.enableFunctionsUnderDev);

  SettingState.def()
      : themeMode = ThemeMode.system,
        enableFunctionsUnderDev = false;

  factory SettingState.fromJson(Map<String, dynamic> json) =>
      _$SettingStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingStateToJson(this);

  SettingState copyWith({
    ThemeMode themeMode,
    bool enableFunctionsUnderDev,
  }) =>
      SettingState(themeMode ?? this.themeMode,
          enableFunctionsUnderDev ?? this.enableFunctionsUnderDev);
}

/// Global UI state include drawerIsOpen, etc.
class UIState {
  /// Drawer is open.
  final bool drawerIsOpen;

  /// Homepage sliders.
  final List<News> homepageNews;

  /// Homepage announcements.
  final List<Announcement> announcements;

  UIState(this.drawerIsOpen, this.homepageNews, this.announcements);

  UIState.def()
      : drawerIsOpen = false,
        homepageNews = null,
        announcements = null;

  UIState copyWith(
          {bool drawerIsOpen, List<News> homepageNews, List announcements}) =>
      UIState(
          drawerIsOpen ?? this.drawerIsOpen,
          homepageNews ?? this.homepageNews,
          announcements ?? this.announcements);
}
