// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPlaceModel _$OrderPlaceModelFromJson(Map<String, dynamic> json) =>
    OrderPlaceModel(
      total_price: (json['total_price'] as num?)?.toDouble(),
      delivery_location: json['delivery_location'] as String?,
      final_price: (json['final_price'] as num?)?.toDouble(),
      delivery_price: (json['delivery_price'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      payment_details: json['payment_details'] == null
          ? null
          : PaymentModel.fromJson(
              json['payment_details'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SelectedShoeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderPlaceModelToJson(OrderPlaceModel instance) =>
    <String, dynamic>{
      'total_price': instance.total_price,
      'delivery_price': instance.delivery_price,
      'final_price': instance.final_price,
      'delivery_location': instance.delivery_location,
      'remarks': instance.remarks,
      'payment_details': instance.payment_details,
      'items': instance.items,
    };
