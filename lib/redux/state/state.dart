import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';
part 'user.dart';

@immutable
@JsonSerializable()
class AppState {
  @JsonKey(ignore: true)
  final bool isInitialized;

  final UserState user;

  const AppState({
    this.isInitialized = false,
    this.user = const UserState(),
  });

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  AppState copyWith({
    bool? isInitialized,
    UserState? user,
  }) =>
      AppState(
        isInitialized: isInitialized ?? this.isInitialized,
        user: user ?? this.user,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isInitialized == other.isInitialized &&
          user == other.user;

  @override
  int get hashCode => isInitialized.hashCode ^ user.hashCode;
}
