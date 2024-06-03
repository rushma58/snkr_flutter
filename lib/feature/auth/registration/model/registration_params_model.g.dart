// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationParamsModel _$RegistrationParamsModelFromJson(
        Map<String, dynamic> json) =>
    RegistrationParamsModel(
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      contact_number: json['contact_number'] as String?,
      password: json['password'] as String?,
      payment_number: json['payment_number'] as String?,
      current_address: json['current_address'] as String?,
    );

Map<String, dynamic> _$RegistrationParamsModelToJson(
        RegistrationParamsModel instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'role': instance.role,
      'email': instance.email,
      'contact_number': instance.contact_number,
      'password': instance.password,
      'payment_number': instance.payment_number,
      'current_address': instance.current_address,
    };
