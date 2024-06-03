import 'package:json_annotation/json_annotation.dart';

part 'registration_params_model.g.dart';

@JsonSerializable()
class RegistrationParamsModel {
  String? first_name;
  String? last_name;
  String? role;
  String? email;
  String? contact_number;
  String? password;
  String? payment_method;
  String? current_address;

  RegistrationParamsModel({
    this.first_name,
    this.last_name,
    this.role,
    this.email,
    this.contact_number,
    this.password,
    this.payment_method,
    this.current_address,
  });

  factory RegistrationParamsModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationParamsModelToJson(this);
}
