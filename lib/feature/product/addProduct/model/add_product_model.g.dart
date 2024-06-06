// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductModel _$AddProductModelFromJson(Map<String, dynamic> json) =>
    AddProductModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      category: json['category'] as String?,
      size: json['size'] as String?,
      color: json['color'] as String?,
      price: (json['price'] as num?)?.toInt(),
      discount_price: (json['discount_price'] as num?)?.toInt(),
      description: json['description'] as String?,
      material: json['material'] as String?,
      sku: json['sku'] as String?,
      release_date: json['release_date'] as String?,
      images: json['images'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      dimensions: json['dimensions'] as String?,
      gender: json['gender'] as String?,
      status: json['status'] as String?,
      user_id: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddProductModelToJson(AddProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'model': instance.model,
      'category': instance.category,
      'size': instance.size,
      'color': instance.color,
      'price': instance.price,
      'discount_price': instance.discount_price,
      'description': instance.description,
      'material': instance.material,
      'sku': instance.sku,
      'release_date': instance.release_date,
      'images': instance.images,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'gender': instance.gender,
      'status': instance.status,
      'user_id': instance.user_id,
    };
