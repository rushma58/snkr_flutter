// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponseModel _$RegistrationResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegistrationResponseModel(
      id: (json['id'] as num?)?.toInt(),
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      contact_number: json['contact_number'] as String?,
      password: json['password'] as String?,
      payment_method: json['payment_method'] as String?,
      current_address: json['current_address'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$RegistrationResponseModelToJson(
        RegistrationResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'role': instance.role,
      'email': instance.email,
      'contact_number': instance.contact_number,
      'password': instance.password,
      'payment_method': instance.payment_method,
      'current_address': instance.current_address,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
    };
