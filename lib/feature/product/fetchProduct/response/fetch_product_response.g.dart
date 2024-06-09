// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchProductResponse _$FetchProductResponseFromJson(
        Map<String, dynamic> json) =>
    FetchProductResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FetchProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchProductResponseToJson(
        FetchProductResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
