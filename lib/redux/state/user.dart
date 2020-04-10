part of 'state.dart';

@JsonSerializable()
class User {
  static final _studentIdExp = RegExp(r'^[A-Za-z]{3}[0-9]{7}$');

  /// User authentication (Campus ID).
  final String campusId, password;

  /// Whether the user is student.
  final bool isStudent;

  /// E-payment password.
  final String ePaymentPassword;

  /// User profile.
  final Profile profile;

  User(this.campusId, this.password, this.ePaymentPassword, this.profile)
      : this.isStudent = _studentIdExp.hasMatch(campusId);

  User.def()
      : campusId = null,
        password = null,
        isStudent = false,
        ePaymentPassword = null,
        profile = null;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith(
          {String campusID,
          String campusIDPassword,
          String ePaymentPassword,
          String moodleKey,
          Profile profile}) =>
      User(
        campusID ?? this.campusId,
        campusIDPassword ?? this.password,
        ePaymentPassword ?? this.ePaymentPassword,
        profile ?? this.profile,
      );

  /// Whether user is a foundation student.
  bool get isFoundation => isStudent && campusId.startsWith(RegExp(r'fis|fia'));
}
