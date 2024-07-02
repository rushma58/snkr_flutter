// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_shoe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedShoeModel _$SelectedShoeModelFromJson(Map<String, dynamic> json) =>
    SelectedShoeModel(
      shoe_id: (json['shoe_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      unit_price: (json['unit_price'] as num?)?.toDouble(),
      total_price: (json['total_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SelectedShoeModelToJson(SelectedShoeModel instance) =>
    <String, dynamic>{
      'shoe_id': instance.shoe_id,
      'quantity': instance.quantity,
      'unit_price': instance.unit_price,
      'total_price': instance.total_price,
    };
