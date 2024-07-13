// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartModel _$GetCartModelFromJson(Map<String, dynamic> json) => GetCartModel(
      id: (json['id'] as num?)?.toInt(),
      shoe_id: (json['shoe_id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      shoe: json['shoe'] == null
          ? null
          : AddProductModelResponse.fromJson(
              json['shoe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartModelToJson(GetCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shoe_id': instance.shoe_id,
      'user_id': instance.user_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'shoe': instance.shoe,
    };
