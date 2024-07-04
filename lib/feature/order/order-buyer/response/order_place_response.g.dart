// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPlaceResponse _$OrderPlaceResponseFromJson(Map<String, dynamic> json) =>
    OrderPlaceResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      order_detail: json['order_detail'] == null
          ? null
          : OrderDetailModel.fromJson(
              json['order_detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderPlaceResponseToJson(OrderPlaceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'order_detail': instance.order_detail,
    };
