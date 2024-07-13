// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      order_id: (json['order_id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      order_date: json['order_date'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'user_id': instance.user_id,
      'order_date': instance.order_date,
      'status': instance.status,
    };
