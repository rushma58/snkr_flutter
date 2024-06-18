import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_model.dart';

part 'fetch_product_response.g.dart';

@JsonSerializable()
class FetchProductResponse {
  bool? success;
  List<FetchProductModel>? data;

  FetchProductResponse({
    this.success,
    this.data,
  });

  factory FetchProductResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FetchProductResponseToJson(this);
}
