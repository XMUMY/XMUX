part of 'state.dart';

@JsonSerializable()
class UserState {
  static final _studentIdExp = RegExp(r'^[A-Za-z]{3}[0-9]{7}$');

  /// User authentication (Campus ID).
  final String campusId, password;

  /// E-payment password.
  final String ePaymentPassword;

  const UserState({
    this.campusId = '',
    this.password = '',
    this.ePaymentPassword = '',
  });

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  Map<String, dynamic> toJson() => _$UserStateToJson(this);

  UserState copyWith({
    String? campusId,
    String? password,
    String? ePaymentPassword,
  }) =>
      UserState(
        campusId: campusId ?? this.campusId,
        password: password ?? this.password,
        ePaymentPassword: ePaymentPassword ?? this.ePaymentPassword,
      );

  bool get isSignedIn => campusId.isNotEmpty && password.isNotEmpty;

  /// Whether the user is student.
  bool get isStudent => _studentIdExp.hasMatch(campusId);

  /// Whether user is a foundation student.
  bool get isFoundation => isStudent && campusId.startsWith(RegExp(r'fis|fia'));
}
