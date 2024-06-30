// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseModel _$AddToCartResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddToCartResponseModel(
      user_id: (json['user_id'] as num?)?.toInt(),
      shoe_id: json['shoe_id'] as String?,
      id: (json['id'] as num?)?.toInt(),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AddToCartResponseModelToJson(
        AddToCartResponseModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'shoe_id': instance.shoe_id,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'id': instance.id,
    };
