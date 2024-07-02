// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    OrderDetailModel(
      order_id: (json['order_id'] as num?)?.toInt(),
      order_date: json['order_date'] as String?,
      delivery_location: json['delivery_location'] as String?,
      remarks: json['remarks'] as String?,
      status: json['status'] as String?,
      user_id: (json['user_id'] as num?)?.toInt(),
      total_price: (json['total_price'] as num?)?.toDouble(),
      delivery_price: (json['delivery_price'] as num?)?.toDouble(),
      final_price: (json['final_price'] as num?)?.toDouble(),
      payment_details: json['payment_details'] == null
          ? null
          : PaymentModel.fromJson(
              json['payment_details'] as Map<String, dynamic>),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'order_date': instance.order_date,
      'delivery_location': instance.delivery_location,
      'remarks': instance.remarks,
      'status': instance.status,
      'user_id': instance.user_id,
      'total_price': instance.total_price,
      'delivery_price': instance.delivery_price,
      'final_price': instance.final_price,
      'payment_details': instance.payment_details,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
    };
