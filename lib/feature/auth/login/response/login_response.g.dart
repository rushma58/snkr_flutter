// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      access_token: json['access_token'] as String?,
      token_type: json['token_type'] as String?,
      expires_in: (json['expires_in'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : RegistrationResponseModel.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'user': instance.user,
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
    };
