// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_order_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerOrderStatusResponse _$SellerOrderStatusResponseFromJson(
        Map<String, dynamic> json) =>
    SellerOrderStatusResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductStatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recent_orders: (json['recent_orders'] as List<dynamic>?)
          ?.map((e) => RecentOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SellerOrderStatusResponseToJson(
        SellerOrderStatusResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'products': instance.products,
      'recent_orders': instance.recent_orders,
    };
