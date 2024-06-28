// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_product_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchProductParamsModel _$FetchProductParamsModelFromJson(
        Map<String, dynamic> json) =>
    FetchProductParamsModel(
      status: json['status'] as String?,
      category: json['category'] as String?,
      brand: json['brand'] as String?,
      name: json['name'] as String?,
      min_price: json['min_price'] as String?,
      max_price: json['max_price'] as String?,
    );

Map<String, dynamic> _$FetchProductParamsModelToJson(
        FetchProductParamsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'category': instance.category,
      'brand': instance.brand,
      'name': instance.name,
      'min_price': instance.min_price,
      'max_price': instance.max_price,
    };
