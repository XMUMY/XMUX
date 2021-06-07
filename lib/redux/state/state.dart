import 'package:emgs/model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moodle/model/assignment.dart';
import 'package:xmus_client/generated/aaos.pb.dart';
import 'package:xmus_client/generated/user.pb.dart';

part 'query.dart';
part 'state.g.dart';
part 'user.dart';

@immutable
@JsonSerializable()
class AppState {
  @JsonKey(ignore: true)
  final bool isInitialized;

  final UserState user;

  final QueryState queries;

  AppState({
    this.isInitialized = false,
    UserState? user,
    QueryState? queries,
  })  : user = user ?? UserState(),
        queries = queries ?? QueryState();

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  AppState copyWith({
    bool? isInitialized,
    UserState? user,
    QueryState? queries,
  }) =>
      AppState(
        isInitialized: isInitialized ?? this.isInitialized,
        user: user ?? this.user,
        queries: queries ?? this.queries,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isInitialized == other.isInitialized &&
          user == other.user &&
          queries == other.queries;

  @override
  int get hashCode => isInitialized.hashCode ^ user.hashCode ^ queries.hashCode;
}
