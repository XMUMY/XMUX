part of 'state.dart';

@JsonSerializable()
class UserState {
  static final _studentIdExp = RegExp(r'^[A-Za-z]{3}[0-9]{7}$');

  /// User authentication (Campus ID).
  final String campusId, password;

  /// E-payment password.
  final String ePaymentPassword;

  final Profile profile;

  UserState({
    this.campusId = '',
    this.password = '',
    this.ePaymentPassword = '',
    Profile? profile,
  }) : profile = profile ?? Profile();

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  Map<String, dynamic> toJson() => _$UserStateToJson(this);

  UserState copyWith({
    String? campusId,
    String? password,
    String? ePaymentPassword,
    Profile? profile,
  }) =>
      UserState(
        campusId: campusId ?? this.campusId,
        password: password ?? this.password,
        ePaymentPassword: ePaymentPassword ?? this.ePaymentPassword,
        profile: profile ?? this.profile,
      );

  bool get isSignedIn => campusId.isNotEmpty && password.isNotEmpty;

  /// Whether the user is student.
  bool get isStudent => _studentIdExp.hasMatch(campusId);

  /// Whether user is a foundation student.
  bool get isFoundation => isStudent && campusId.startsWith(RegExp(r'fis|fia'));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          campusId == other.campusId &&
          password == other.password &&
          ePaymentPassword == other.ePaymentPassword &&
          profile == other.profile;

  @override
  int get hashCode =>
      campusId.hashCode ^
      password.hashCode ^
      ePaymentPassword.hashCode ^
      profile.hashCode;
}
