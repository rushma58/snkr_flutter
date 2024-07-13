import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/cart/model/getCart/get_cart_model.dart';

part 'get_cart_response.g.dart';

@JsonSerializable()
class GetCartResponse {
  bool? success;
  String? message;
  List<GetCartModel>? data;

  GetCartResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetCartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartResponseToJson(this);
}
