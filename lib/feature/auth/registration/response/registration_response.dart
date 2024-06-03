import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/auth/registration/response/registration_response_model.dart';

part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  bool? success;
  String? message;
  RegistrationResponseModel? data;

  RegistrationResponse({
    this.success,
    this.message,
    this.data,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}
