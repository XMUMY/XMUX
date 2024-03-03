import 'package:emgs/model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moodle/moodle.dart';
import 'package:xmus_client/api/aaos/v4/aaos.pb.dart';
import 'package:xmus_client/api/user.pb.dart';

part 'query.dart';
part 'setting.dart';
part 'state.g.dart';
part 'user.dart';

@immutable
@JsonSerializable()
class AppState {
  @JsonKey(ignore: true)
  final bool isInitialized;

  final UserState user;

  final QueryState queries;

  final SettingState settings;

  AppState({
    this.isInitialized = false,
    UserState? user,
    QueryState? queries,
    SettingState? settings,
  })  : user = user ?? UserState(),
        queries = queries ?? QueryState(),
        settings = settings ?? SettingState();

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  AppState copyWith({
    bool? isInitialized,
    UserState? user,
    QueryState? queries,
    SettingState? settings,
  }) =>
      AppState(
        isInitialized: isInitialized ?? this.isInitialized,
        user: user ?? this.user,
        queries: queries ?? this.queries,
        settings: settings ?? this.settings,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isInitialized == other.isInitialized &&
          user == other.user &&
          queries == other.queries &&
          settings == other.settings;

  @override
  int get hashCode =>
      isInitialized.hashCode ^
      user.hashCode ^
      queries.hashCode ^
      settings.hashCode;
}
