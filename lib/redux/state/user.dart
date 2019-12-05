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

  /// Moodle key.
  final String moodleKey;

  User(this.campusId, this.password, this.ePaymentPassword, this.moodleKey)
      : this.isStudent = _studentIdExp.hasMatch(campusId);

  User.def()
      : this.campusId = null,
        this.password = null,
        this.ePaymentPassword = null,
        this.moodleKey = null,
        this.isStudent = false;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith(
          {String campusID,
          String campusIDPassword,
          String ePaymentPassword,
          String moodleKey}) =>
      User(
          campusID ?? this.campusId,
          campusIDPassword ?? this.password,
          ePaymentPassword ?? this.ePaymentPassword,
          moodleKey ?? this.moodleKey);

  /// Whether user is a foundation student.
  bool get isFoundation => isStudent && campusId.startsWith(RegExp(r'fis|fia'));
}
