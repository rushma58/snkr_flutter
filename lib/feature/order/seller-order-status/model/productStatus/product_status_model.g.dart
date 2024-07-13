// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStatusModel _$ProductStatusModelFromJson(Map<String, dynamic> json) =>
    ProductStatusModel(
      shoe_id: (json['shoe_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'] as String?,
      status: json['status'] as String?,
      ordered_count: (json['ordered_count'] as num?)?.toInt(),
      delivered_count: (json['delivered_count'] as num?)?.toInt(),
      images: json['images'] as String?,
    );

Map<String, dynamic> _$ProductStatusModelToJson(ProductStatusModel instance) =>
    <String, dynamic>{
      'shoe_id': instance.shoe_id,
      'name': instance.name,
      'price': instance.price,
      'status': instance.status,
      'ordered_count': instance.ordered_count,
      'delivered_count': instance.delivered_count,
      'images': instance.images,
    };
