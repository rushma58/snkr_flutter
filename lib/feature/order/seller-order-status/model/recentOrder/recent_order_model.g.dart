// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentOrderModel _$RecentOrderModelFromJson(Map<String, dynamic> json) =>
    RecentOrderModel(
      order_item_id: (json['order_item_id'] as num?)?.toInt(),
      order_id: (json['order_id'] as num?)?.toInt(),
      shoe_id: (json['shoe_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      unit_price: json['unit_price'] as String?,
      total_price: json['total_price'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      order: json['order'] == null
          ? null
          : OrderModel.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentOrderModelToJson(RecentOrderModel instance) =>
    <String, dynamic>{
      'order_item_id': instance.order_item_id,
      'order_id': instance.order_id,
      'shoe_id': instance.shoe_id,
      'quantity': instance.quantity,
      'unit_price': instance.unit_price,
      'total_price': instance.total_price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'order': instance.order,
    };
