// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCartResponse _$DeleteCartResponseFromJson(Map<String, dynamic> json) =>
    DeleteCartResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteCartResponseToJson(DeleteCartResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
