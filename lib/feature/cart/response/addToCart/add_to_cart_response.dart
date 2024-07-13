import 'package:json_annotation/json_annotation.dart';

import '../../model/addToCart/add_to_cart_response_model.dart';

part 'add_to_cart_response.g.dart';

@JsonSerializable()
class AddToCartResponse {
  bool? success;
  String? message;
  AddToCartResponseModel? data;

  AddToCartResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);
}
