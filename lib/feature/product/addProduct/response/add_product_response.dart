import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/product/addProduct/model/add_product_model.dart';

part 'add_product_response.g.dart';

@JsonSerializable()
class AddProductResponse {
  bool? success;
  String? message;
  AddProductModel? data;

  AddProductResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AddProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductResponseToJson(this);
}
