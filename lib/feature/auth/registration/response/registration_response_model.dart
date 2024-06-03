import 'package:json_annotation/json_annotation.dart';

part 'registration_response_model.g.dart';

@JsonSerializable()
class RegistrationResponseModel {
  int? id;
  String? first_name;
  String? last_name;
  String? role;
  String? email;
  String? contact_number;
  String? password;
  String? payment_method;
  String? current_address;
  String? updated_at;
  String? created_at;

  RegistrationResponseModel({
    this.id,
    this.first_name,
    this.last_name,
    this.role,
    this.email,
    this.contact_number,
    this.password,
    this.payment_method,
    this.current_address,
    this.updated_at,
    this.created_at,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseModelToJson(this);
}
