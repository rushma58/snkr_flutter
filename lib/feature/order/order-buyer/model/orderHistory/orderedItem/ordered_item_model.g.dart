// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordered_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedItemModel _$OrderedItemModelFromJson(Map<String, dynamic> json) =>
    OrderedItemModel(
      order_item_id: (json['order_item_id'] as num?)?.toInt(),
      shoe_id: (json['shoe_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      unit_price: json['unit_price'] as String?,
      total_price: json['total_price'] as String?,
      images: json['images'] as String?,
    );

Map<String, dynamic> _$OrderedItemModelToJson(OrderedItemModel instance) =>
    <String, dynamic>{
      'order_item_id': instance.order_item_id,
      'shoe_id': instance.shoe_id,
      'name': instance.name,
      'brand': instance.brand,
      'quantity': instance.quantity,
      'unit_price': instance.unit_price,
      'total_price': instance.total_price,
      'images': instance.images,
    };
