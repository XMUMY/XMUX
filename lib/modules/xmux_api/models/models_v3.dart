import 'package:json_annotation/json_annotation.dart';

part 'models_v3.g.dart';

@JsonSerializable(createToJson: false)
class LoginResp {
  final String customToken;

  LoginResp(this.customToken);

  static LoginResp fromJson(Map<String, dynamic> json) =>
      _$LoginRespFromJson(json);
}
