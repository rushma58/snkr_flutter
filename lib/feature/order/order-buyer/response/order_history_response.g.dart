// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryResponse _$OrderHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    OrderHistoryResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderHistoryResponseToJson(
        OrderHistoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'orders': instance.orders,
    };
