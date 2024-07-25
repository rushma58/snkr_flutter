import 'package:json_annotation/json_annotation.dart';

part 'login_params_model.g.dart';

@JsonSerializable()
class LoginParamsModel {
  String? email;
  String? password;
  String? fcmToken;

  LoginParamsModel({
    this.email,
    this.password,
    this.fcmToken,
  });

  factory LoginParamsModel.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParamsModelToJson(this);
}
