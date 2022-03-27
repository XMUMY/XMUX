part of 'state.dart';

@JsonSerializable()
class SettingState {
  @JsonKey(ignore: true)
  final bool showPerformanceOverlay;

  @JsonKey(ignore: true)
  final bool showSemanticsDebugger;

  @JsonKey(ignore: true)
  final bool enableDevFunctions;

  SettingState({
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.enableDevFunctions = false,
  });

  factory SettingState.fromJson(Map<String, dynamic> json) =>
      _$SettingStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingStateToJson(this);

  SettingState copyWith({
    bool? showPerformanceOverlay,
    bool? showSemanticsDebugger,
    bool? enableDevFunctions,
  }) =>
      SettingState(
        showPerformanceOverlay:
            showPerformanceOverlay ?? this.showPerformanceOverlay,
        showSemanticsDebugger:
            showSemanticsDebugger ?? this.showSemanticsDebugger,
        enableDevFunctions: enableDevFunctions ?? this.enableDevFunctions,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingState &&
          showPerformanceOverlay == other.showPerformanceOverlay &&
          showSemanticsDebugger == other.showSemanticsDebugger &&
          enableDevFunctions == other.enableDevFunctions;

  @override
  int get hashCode =>
      showPerformanceOverlay.hashCode ^
      showSemanticsDebugger.hashCode ^
      enableDevFunctions.hashCode;
}
