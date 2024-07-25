// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    OrderHistoryModel(
      order_id: (json['order_id'] as num?)?.toInt(),
      order_date: json['order_date'] as String?,
      status: json['status'] as String?,
      delivery_location: json['delivery_location'] as String?,
      delivery_price: json['delivery_price'] as String?,
      total_price: json['total_price'] as String?,
      final_price: json['final_price'] as String?,
      remarks: json['remarks'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderedItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderHistoryModelToJson(OrderHistoryModel instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'order_date': instance.order_date,
      'status': instance.status,
      'delivery_location': instance.delivery_location,
      'delivery_price': instance.delivery_price,
      'total_price': instance.total_price,
      'final_price': instance.final_price,
      'remarks': instance.remarks,
      'items': instance.items,
    };
