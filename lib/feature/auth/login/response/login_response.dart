import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/auth/registration/response/registration_response_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? success;
  String? message;
  RegistrationResponseModel? user;
  String? token;

  LoginResponse({
    this.success,
    this.message,
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
